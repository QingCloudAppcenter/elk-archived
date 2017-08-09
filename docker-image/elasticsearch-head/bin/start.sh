flock -n /tmp/esh.lock -c "/opt/elasticsearch-head/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Start]=] Can't lock the file."
else
    echo "[=[Start]=] Lock the file successfully."
fi
