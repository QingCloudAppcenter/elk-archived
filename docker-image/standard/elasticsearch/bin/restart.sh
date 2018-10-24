#!/bin/bash

chown -R elasticsearch:elasticsearch /opt/elasticsearch
flock -n /tmp/es.lock -c "/opt/elasticsearch/bin/dorestart.sh"
if [ $? -ne 0 ]; then
    echo "[=[Restart]=] Can't lock the file."
else
    echo "[=[Restart]=] Lock the file successfully."
    rm -f /tmp/es.lock
fi
