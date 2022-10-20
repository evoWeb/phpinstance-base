#!/bin/sh

apt install inotify-tools supervisor
ln -s ./sync.conf /etc/supervisor/conf.d/sync.conf

supervisorctl reread
supervisorctl update
