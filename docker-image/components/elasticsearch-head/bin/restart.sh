#!/bin/bash

flock -n /tmp/esh.lock -c "/opt/elasticsearch-head/bin/dorestart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Restart]=] Can't lock the file."
else
    echo "[=[Restart]=] Lock the file successfully."
    rm -f /tmp/esh.lock
fi
