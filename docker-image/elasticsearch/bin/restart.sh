chown -R elasticsearch:elasticsearch /opt/elasticsearch
flock -n /tmp/es.lock -c "/opt/elasticsearch/bin/dorestart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Restart]=] Can't lock the file."
else
    echo "[=[Restart]=] Lock the file successfully."
fi
rm -f /tmp/es.lock
