#!/bin/sh
#set -x #echo on
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-exim}:x:$(id -u):0:${USER_NAME:-exim} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

exec "$@"