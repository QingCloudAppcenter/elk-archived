#!/bin/bash

flock -n /tmp/es.lock -c "/opt/elasticsearch/bin/dostop.sh"
if [ $? -ne 0 ]; then
    echo "[=[Stop]=] Can't lock the file."
else
    echo "[=[Stop]=] Lock the file successfully."
    rm -f /tmp/es.lock
fi
