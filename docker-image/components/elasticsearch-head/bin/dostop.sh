#!/bin/bash

echo "[Stop] Preparing for stoping Head..."
PID=`pidof grunt`
echo "[Stop] Head pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill head with pid ${PID}."
    kill -15 $PID
else
    echo "[Stop] Head is not running."
fi
