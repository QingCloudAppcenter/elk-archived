echo "[Start] Preparing for starting logstash..."

. /opt/logstash/bin/func.sh

PID=`pidof java`
echo "[Start] Logstash pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting logstash..."
    nohup /opt/logstash/bin/logstash -f /opt/logstash/config/logstash.conf >> /opt/qingcloud/app-agent/log/app.log &
    waitport 127.0.0.1 9600
    echo "[Start] Logstash is started."
else
    echo "[Start] Logstash is already started."
fi

