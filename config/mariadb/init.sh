#!/bin/sh

execute () {
  mysql --user="root" --password="${MYSQL_ROOT_PASSWORD}" --execute="$1"
}

echo "*** Creating ${APP_NAME}_production DB and users"

execute "CREATE DATABASE \`${APP_NAME}_production\` CHARACTER SET utf8mb4;"
execute "CREATE USER '${APP_NAME}_production' IDENTIFIED BY '${MYSQL_PRODUCTION_PASSWORD}';"
execute "GRANT ALL privileges ON \`${APP_NAME}_production\`.* TO '${APP_NAME}_production'@'%';"

echo "*** Creating ${APP_NAME}_staging DB and users"

execute "CREATE DATABASE \`${APP_NAME}_staging\` CHARACTER SET utf8mb4;"
execute "CREATE USER '${APP_NAME}_staging' IDENTIFIED BY '${MYSQL_STAGING_PASSWORD}';"
execute "GRANT ALL privileges ON \`${APP_NAME}_staging\`.* TO '${APP_NAME}_staging'@'%';"

echo "*** Finished creating DBs and users"