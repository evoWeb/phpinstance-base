#!/bin/bash

TARGET_PRODUCTION="/srv/${LOCAL_INSTANCE}/data/htdocs/production/shared"
TARGET_STAGING="/srv/${LOCAL_INSTANCE}/data/htdocs/staging/shared"

inotifywait -m \
  -r \
  -e create -e close_write -e move -e delete \
  --format "%w%f@%e" \
  "${TARGET_PRODUCTION}" "${TARGET_STAGING}" |
  while IFS=@ read -r path action; do
    if [[ ! -f "${path}" && ! -f "${path}" ]]; then continue; fi

    FROM="${path}"
    TO="${path/"$LOCAL_INSTANCE"/"$REMOTE_INSTANCE"}"
    PARENT_FOLDER="$(dirname $TO)"
    if [[ $action =~ "DELETE" || $action =~ "MOVED_FROM" ]]; then
      echo "Remove ${TO} from ${REMOTE_SERVER} because of ${action} on ${FROM}"
      ssh -n "root@${REMOTE_SERVER}" rm -rf "${TO}"
    else
      echo "Transfer ${TO} to ${REMOTE_SERVER} because of ${action} on ${FROM}"
      if [[ -d "${FROM}" ]]; then
        ssh -n "root@${REMOTE_SERVER}" mkdir -p "${TO}"
      else
        rsync -a "${FROM}" "root@${REMOTE_SERVER}:${PARENT_FOLDER}"
      fi
    fi
  done
