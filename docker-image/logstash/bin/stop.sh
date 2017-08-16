#!/bin/bash

flock -n /tmp/lst.lock -c "/opt/logstash/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Stop]=] Can't lock the file."
else
    echo "[=[Stop]=] Lock the file successfully."
fi
rm -f /tmp/lst.lock
