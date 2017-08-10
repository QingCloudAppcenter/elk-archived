echo "[Stop] Preparing for stoping caddy..."
PID=`pidof caddy`
echo "[Stop] Caddy pid is ${PID}."

if [ -n "$PID" ]; then
    echo "[Stop] Kill caddy with pid ${PID}."
    kill -9 $PID
else
    echo "[Stop] Caddy is not running."
fi
