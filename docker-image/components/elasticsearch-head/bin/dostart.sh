#!/bin/bash

echo "[Start] Preparing for starting head..."
. /opt/elasticsearch-head/bin/func.sh

PID=`pidof grunt`
echo "[Start] Head pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting head..."
    nohup npm run start >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 9100
    echo "[Start] Head is started."
else
    echo "[Start] Head is already started."
fi

