echo "[Start] Preparing for starting caddy..."
. /opt/kibana/bin/func.sh

PID=`pidof caddy`
echo "[Start] Caddy pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting caddy..."
    nohup caddy -conf /opt/kibana/config/Caddyfile &
    waitport 127.0.0.1 9200
    echo "[Start] Caddy is started."
else
    echo "[Start] Caddy is already started."
fi

