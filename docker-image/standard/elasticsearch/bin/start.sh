#!/bin/bash

chown -R elasticsearch:elasticsearch /opt/elasticsearch
flock -n /tmp/es.lock -c "/opt/elasticsearch/bin/dostart.sh"
if [ $? -ne 0 ]; then
    echo "[=[Start]=] Can't lock the file."
else
    echo "[=[Start]=] Lock the file successfully."
    rm -f /tmp/es.lock
fi
