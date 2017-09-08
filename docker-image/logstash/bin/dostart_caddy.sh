#!/bin/bash

echo "[Start] Preparing for starting caddy..."
. /opt/logstash/bin/func.sh

PID=`pidof caddy`
echo "[Start] Caddy pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting caddy..."
    mkdir -p /data/elasticsearch/dicts
    mkdir -p /data/elasticsearch/logs

    nohup caddy -conf /opt/logstash/config/Caddyfile >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
    sleep 2
    while ! nc -z 127.0.0.1 80; do
            nohup caddy -conf /opt/logstash/config/Caddyfile >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
            sleep 2
    done
    echo "[Start] Caddy is started."
else
    echo "[Start] Caddy is already started."
fi

