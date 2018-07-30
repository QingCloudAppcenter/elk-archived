#!/bin/bash

echo "[Restart] Restarting elasticsearch..." >> /opt/qingcloud/app-agent/log/app.log
/opt/elasticsearch/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 1 && \
/opt/elasticsearch/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Elasticsearch is restarted." >> /opt/qingcloud/app-agent/log/app.log
