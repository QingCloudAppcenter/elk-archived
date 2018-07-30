#!/bin/bash

echo "[Stop] Preparing for stoping Cerebro..."
PID=`pidof java`
echo "[Stop] Cerebro pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill Cerebro with pid ${PID}."
    kill -9 $PID
else
    echo "[Stop] Cerebro is not running."
fi
