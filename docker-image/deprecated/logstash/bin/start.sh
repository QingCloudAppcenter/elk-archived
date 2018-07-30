#!/bin/bash

/opt/logstash/bin/dostart_caddy.sh

flock -n /tmp/lst.lock -c "/opt/logstash/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Start]=] Can't lock the file."
else
    echo "[=[Start]=] Lock the file successfully."
    rm -f /tmp/lst.lock
fi
