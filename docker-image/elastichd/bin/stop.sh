#!/bin/bash

flock -n /tmp/eshd.lock -c "/opt/elastichd/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Stop]=] Can't lock the file."
else
    echo "[=[Stop]=] Lock the file successfully."
    rm -f /tmp/eshd.lock
fi
