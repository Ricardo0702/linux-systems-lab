#!/usr/bin/bash

CONFIG_FILE="/etc/troubleshooting-app/app.conf"

echo "Application starting..."

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "ERROR: Required configuration file is unavailable." >&2
    exit 1
fi

source "$CONFIG_FILE"

if [[ "$ENABLED" != "true" ]]; then
    echo "ERROR: Application is disabled by configuration." >&2
    exit 1
fi

echo "Application started successfully."

while true
do
    sleep 30
done