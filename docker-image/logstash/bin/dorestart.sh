echo "[Restart] Restarting logstash..." >> /opt/qingcloud/app-agent/log/app.log
/opt/logstash/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 1 && \
/opt/logstash/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Logstash is restarted." >> /opt/qingcloud/app-agent/log/app.log
