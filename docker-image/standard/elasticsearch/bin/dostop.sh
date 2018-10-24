#!/bin/bash

set -e

. /opt/elasticsearch/bin/func.sh

log "[Stop] Preparing for stoping elasticsearch..."
PID=`ps -ef|grep -w Elasticsearch | grep -v "grep -w Elasticsearch"|awk '{print $1}'`
log "[Stop] Elasticsearch pid is ${PID}."

if [ -n "$PID" ]; then
    log "[Stop] Kill elasticsearch with pid ${PID}."
    kill -9 $PID
else
    log "[Stop] Elasticsearch is not running."
fi
