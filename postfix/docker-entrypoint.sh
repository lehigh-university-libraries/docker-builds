#/usr/bin/env bash

set -eou pipefail

dockerize -template /etc/postfix/main.cf.tmpl:/etc/postfix/main.cf postfix start-fg

