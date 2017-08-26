#!/bin/bash

echo "[Start] Preparing for starting caddy..."
. /opt/logstash/bin/func.sh

PID=`pidof caddy`
echo "[Start] Caddy pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting caddy..."
    mkdir -p /data/elasticsearch/dicts
    mkdir -p /data/elasticsearch/slowlog
    nohup caddy -conf /opt/logstash/config/Caddyfile >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 80
    echo "[Start] Caddy is started."
else
    echo "[Start] Caddy is already started."
fi

