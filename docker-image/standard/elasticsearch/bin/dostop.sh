#!/bin/bash

set -e

echo "[Stop] Preparing for stoping elasticsearch..."
PID=`ps -ef|grep -w Elasticsearch | grep -v "grep -w Elasticsearch"|awk '{print $1}'`
echo "[Stop] Elasticsearch pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill elasticsearch with pid ${PID}."
    kill -SIGTERM $PID
else
    echo "[Stop] Elasticsearch is not running."
fi
