echo "[Stop] Preparing for stoping kibana..."
PID=`ps -ef|grep -w kibana | grep -v "grep -w kibana"|awk '{print $1}'`
echo "[Stop] Kibana pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill kibana with pid ${PID}."
    kill -SIGTERM $PID
else
    echo "[Stop] Kibana is not running."
fi
