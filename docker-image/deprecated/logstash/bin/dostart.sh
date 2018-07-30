#!/bin/bash

set -e

echo "[Start] Preparing for starting logstash..."

. /opt/logstash/bin/func.sh

PID=`ps -ef|grep '/data/logstash/config/logstash.conf' | grep -v 'grep /data/logstash/config/logstash.conf' | awk '{print $1}'`
echo "[Start] Logstash pid is ${PID}."

if [ -z "$PID" ]; then
    if [ ! -f /data/logstash/config/logstash.conf.lock ]; then
        cp -f /data/logstash/config/logstash.conf.sample /data/logstash/config/logstash.conf
    fi

    echo "[Start] Starting logstash..."
    mkdir -p /data/logstash/plugins/
    export LS_JAVA_OPTS="-Djava.security.egd=file:/dev/urandom"
    nohup /opt/logstash/bin/logstash -f /data/logstash/config/logstash.conf >> /opt/qingcloud/app-agent/log/app.log 2>&1 &
    waitport 127.0.0.1 9600
    echo "[Start] Logstash is started."
else
    echo "[Start] Logstash is already started."
fi

