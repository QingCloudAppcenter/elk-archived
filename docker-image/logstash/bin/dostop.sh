echo "[Stop] Preparing for stoping logstash..."
PID=`pidof java`
echo "[Stop] Logstash pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill logstash with pid ${PID}."
    kill -SIGTERM $PID
else
    echo "[Stop] Logstash is not running."
fi
