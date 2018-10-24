#!/bin/bash

echo "[Restart] Restarting ElasticHD..." >> /opt/qingcloud/app-agent/log/app.log
/opt/elastichd/bin/dostop.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 3 && \
/opt/elastichd/bin/dostart.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] ElasticHD is restarted." >> /opt/qingcloud/app-agent/log/app.log
