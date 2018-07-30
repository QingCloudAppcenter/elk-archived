#!/bin/bash

echo "[Restart] Restarting ES-SQL..." >> /opt/qingcloud/app-agent/log/app.log
/opt/elasticsearch-sql/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 1 && \
/opt/elasticsearch-sql/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log && \
echo "[Restart] ES-SQL is restarted." >> /opt/qingcloud/app-agent/log/app.log
