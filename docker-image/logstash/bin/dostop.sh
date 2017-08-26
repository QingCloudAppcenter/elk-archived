#!/bin/bash

set -e

echo "[Stop] Preparing for stoping logstash..."
PID=`ps -ef|grep '/data/logstash/config/logstash.conf' | grep -v 'grep /data/logstash/config/logstash.conf' | awk '{print $1}'`
echo "[Stop] Logstash pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill logstash with pid ${PID}."
    kill -SIGTERM $PID
else
    echo "[Stop] Logstash is not running."
fi
