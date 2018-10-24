#!/bin/bash

echo "[Start] Preparing for starting ElasticHD..."
. /opt/elastichd/bin/func.sh

PID=`pidof ElasticHD`
echo "[Start] ElasticHD pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting ElasticHD..."
    nohup ElasticHD > /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 9800
    echo "[Start] ElasticHD is started."
else
    echo "[Start] ElasticHD is already started."
fi
