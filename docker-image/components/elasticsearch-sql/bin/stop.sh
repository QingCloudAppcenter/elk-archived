#!/bin/bash

flock -n /tmp/esql.lock -c "/opt/elasticsearch-sql/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Stop]=] Can't lock the file."
else
    echo "[=[Stop]=] Lock the file successfully."
    rm -f /tmp/esql.lock
fi
