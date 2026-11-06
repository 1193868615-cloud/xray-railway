#!/bin/sh
# Railway injects a dynamic $PORT; xray must listen on it.
set -e
PORT="${PORT:-3000}"
sed "s/__PORT__/$PORT/" /etc/xray/config.template.json > /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
