#!/bin/sh
set -eu

# Start the official 3X-UI service.
# Its database remains under /etc/x-ui.
x-ui >/tmp/x-ui.log 2>&1 &

# Wait for the local 3X-UI web/API service.
i=0
while [ "$i" -lt 45 ]; do
  if wget -q -O /dev/null "http://127.0.0.1:2053/" 2>/dev/null; then
    break
  fi
  i=$((i+1))
  sleep 1
done

# Railway supplies PORT at runtime. The dashboard listens on it.
exec python3 /opt/vpnstan/web/server.py
