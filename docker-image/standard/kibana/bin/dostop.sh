#!/bin/bash

echo "[Stop] Preparing for stoping kibana..."
PID=`pidof node`
echo "[Stop] Kibana pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill kibana with pid ${PID}."
    kill -9 $PID
else
    echo "[Stop] Kibana is not running."
fi
