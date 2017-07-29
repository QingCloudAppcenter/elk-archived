echo "[Restart] Restarting elasticsearch..." >> /opt/qingcloud/app-agent/log/app.log
/opt/elasticsearch/bin/stop.sh >> /opt/qingcloud/app-agent/log/app.log
/opt/elasticsearch/bin/start.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Elasticsearch is restarted." >> /opt/qingcloud/app-agent/log/app.log
