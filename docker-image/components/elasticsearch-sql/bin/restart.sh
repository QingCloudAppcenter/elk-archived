#!/bin/bash

flock -n /tmp/esql.lock -c "/opt/elasticsearch-sql/bin/dorestart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Restart]=] Can't lock the file."
else
    echo "[=[Restart]=] Lock the file successfully."
    rm -f /tmp/esql.lock
fi
