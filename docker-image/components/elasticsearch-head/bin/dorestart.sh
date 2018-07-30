#!/bin/bash

echo "[Restart] Restarting head..." >> /opt/qingcloud/app-agent/log/app.log
/opt/elasticsearch-head/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 1 && \
/opt/elasticsearch-head/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Head is restarted." >> /opt/qingcloud/app-agent/log/app.log
