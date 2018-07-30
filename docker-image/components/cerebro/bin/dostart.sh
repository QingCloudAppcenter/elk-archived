#!/bin/bash

echo "[Start] Preparing for starting Cerebro..."
. /opt/cerebro/bin/func.sh

PID=`pidof java`
echo "[Start] Cerebro pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting Cerebro..."
    nohup cerebro >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 9000
    echo "[Start] Cerebro is started."
else
    echo "[Start] Cerebro is already started."
fi

