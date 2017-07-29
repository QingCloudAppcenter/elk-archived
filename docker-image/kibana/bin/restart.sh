echo "[Restart] Restarting kibana..." >> /opt/qingcloud/app-agent/log/app.log
/opt/kibana/bin/stop.sh >> /opt/qingcloud/app-agent/log/app.log
/opt/kibana/bin/start.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Kibana is restarted." >> /opt/qingcloud/app-agent/log/app.log
