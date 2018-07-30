#!/bin/bash

set -e

echo "[Start] Preparing for starting elasticsearch..."

. /opt/elasticsearch/bin/func.sh

ulimit -n 131070
ulimit -l unlimited
sysctl -q -w vm.max_map_count=262144

mkdir -p /data/elasticsearch/data
mkdir -p /data/elasticsearch/logs
chown -R elasticsearch:elasticsearch /data/elasticsearch
chown -R elasticsearch:elasticsearch /opt/elasticsearch

PID=`pidof java || echo ""`

echo "[Start] Elasticsearch pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting elasticsearch..."
    wait_dir_own_by_user /opt/elasticsearch elasticsearch
    nohup /docker-entrypoint.sh elasticsearch >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 9200
    echo "[Start] Elasticsearch is started successfully."
else
    echo "[Start] Elasticsearch is already started."
fi
