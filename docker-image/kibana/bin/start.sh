#!/bin/bash

flock -n /tmp/kbn.lock -c "/opt/kibana/bin/dostart_caddy.sh && /opt/kibana/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Start]=] Can't lock the file."
else
    echo "[=[Start]=] Lock the file successfully."
    rm -f /tmp/kbn.lock
fi
