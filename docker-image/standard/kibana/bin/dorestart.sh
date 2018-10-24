#!/bin/bash

echo "[Restart] Restarting kibana..." >> /opt/qingcloud/app-agent/log/app.log
/opt/kibana/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 3 && \
/opt/kibana/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Kibana is restarted." >> /opt/qingcloud/app-agent/log/app.log
