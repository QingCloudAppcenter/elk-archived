#!/bin/bash

echo "[Stop] Preparing for stoping ElasticHD..."
PID=`pidof ElasticHD`
echo "[Stop] ElasticHD pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill ElasticHD with pid ${PID}."
    kill -15 $PID
else
    echo "[Stop] ElasticHD is not running."
fi
