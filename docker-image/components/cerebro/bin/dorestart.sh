#!/bin/bash

echo "[Restart] Restarting Cerebro..." >> /opt/qingcloud/app-agent/log/app.log
/opt/cerebro/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 1 && \
/opt/cerebro/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log && \
echo "[Restart] Cerebro is restarted." >> /opt/qingcloud/app-agent/log/app.log
