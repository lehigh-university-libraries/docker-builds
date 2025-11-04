#!/command/with-contenv bash
# shellcheck shell=bash

set -e

# Install the bind-mounted certificate if present.
if [[ -s "/usr/local/share/ca-certificates/cert.pem" ]]; then
    update-ca-certificates
fi
