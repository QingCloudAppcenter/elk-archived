#!/bin/bash

nginx -s reload

flock -n /tmp/kbn.lock -c "/opt/kibana/bin/dorestart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Restart]=] Can't lock the file."
else
    echo "[=[Restart]=] Lock the file successfully."
    rm -f /tmp/kbn.lock
fi
