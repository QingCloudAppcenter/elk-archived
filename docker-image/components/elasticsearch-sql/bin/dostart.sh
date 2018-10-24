#!/bin/bash

echo "[Start] Preparing for starting ES-SQL..."
. /opt/elasticsearch-sql/bin/func.sh

PID=`pidof node`
echo "[Start] ES-SQL pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting ES-SQL..."
    cd site-server
    nohup node node-server.js > /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 8080
    echo "[Start] ES-SQL is started."
else
    echo "[Start] ES-SQL is already started."
fi
