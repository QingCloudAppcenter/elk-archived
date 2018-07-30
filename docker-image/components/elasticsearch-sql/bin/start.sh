#!/bin/bash

flock -n /tmp/esql.lock -c "/opt/elasticsearch-sql/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Start]=] Can't lock the file."
else
    echo "[=[Start]=] Lock the file successfully."
    rm -f /tmp/esql.lock
fi
