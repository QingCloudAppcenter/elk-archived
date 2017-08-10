flock -n /tmp/kbn.lock -c "/opt/kibana/bin/dorestart_caddy.sh >> /opt/qingcloud/app-agent/log/app.log"
if [ $? -ne 0 ]; then
    echo "[=[Restart]=] Can't lock the file."
else
    echo "[=[Restart]=] Lock the file successfully."
fi
rm -f /tmp/kbn.lock
