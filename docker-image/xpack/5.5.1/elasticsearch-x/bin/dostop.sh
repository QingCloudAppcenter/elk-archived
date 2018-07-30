#!/bin/bash

set -e

echo "[Stop] Preparing for stoping elasticsearch..."

PID=`pidof java || echo ""`

echo "[Stop] Elasticsearch pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill elasticsearch with pid ${PID}."
    kill -9 $PID
else
    echo "[Stop] Elasticsearch is not running."
fi
