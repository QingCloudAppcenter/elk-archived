#!/bin/bash

set -e

. /opt/elasticsearch/bin/func.sh

log "[Start] Preparing for starting elasticsearch..."

ulimit -n 131070
ulimit -l unlimited
sysctl -q -w vm.max_map_count=262144

mkdir -p /data/elasticsearch/dump
mkdir -p /data/elasticsearch/data
mkdir -p /data/elasticsearch/logs
mkdir -p /data/elasticsearch/analysis
cp -r /data/elasticsearch/analysis/ /opt/elasticsearch/config/
chown -R elasticsearch:elasticsearch /data/elasticsearch
chown -R elasticsearch:elasticsearch /opt/elasticsearch

PID=`ps -ef|grep -w Elasticsearch | grep -v "grep -w Elasticsearch"|awk '{print $1}'`

log "[Start] Elasticsearch pid is ${PID}."

if [ -z "$PID" ]; then
    log "[Start] Starting elasticsearch..."
    wait_dir_own_by_user /opt/elasticsearch elastics
    nohup /docker-entrypoint.sh elasticsearch 2> /opt/qingcloud/app-agent/log/elastic.log &
    waitport 127.0.0.1 9200
    log "[Start] Elasticsearch is started successfully."
else
    log "[Start] Elasticsearch is already started."
fi
