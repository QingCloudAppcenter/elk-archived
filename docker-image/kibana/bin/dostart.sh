echo "[Start] Preparing for starting kibana..."
. /opt/kibana/bin/func.sh


PID=`pidof node`
echo "[Start] Kibana pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting kibana..."
    nohup /opt/kibana/bin/kibana >> /opt/qingcloud/app-agent/log/app.log &
    waitport 127.0.0.1 5601
    echo "[Start] Kibana is started."
else
    echo "[Start] Kibana is already started."
fi

