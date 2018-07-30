#!/bin/bash

flock -n /tmp/cere.lock -c "/opt/cerebro/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Stop]=] Can't lock the file."
else
    echo "[=[Stop]=] Lock the file successfully."
    rm -f /tmp/cere.lock
fi
