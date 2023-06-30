#!/bin/env bash

set -e

envsubst '${PHP_FPM_HOST}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

if [[ "$1" == -* ]]; then
    set -- nginx -g daemon off; "$@"
fi

exec "$@"
