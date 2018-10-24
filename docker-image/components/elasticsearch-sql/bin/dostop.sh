#!/bin/bash

echo "[Stop] Preparing for stoping ES-SQL..."
PID=`pidof node`
echo "[Stop] ES-SQL pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill ES-SQL with pid ${PID}."
    kill -9 $PID
else
    echo "[Stop] ES-SQL is not running."
fi
