#!/bin/bash

echo "[Restart] Restarting caddy..." >> /opt/qingcloud/app-agent/log/app.log
/opt/kibana/bin/dostop_caddy.sh >> /opt/qingcloud/app-agent/log/app.log && \
sleep 1 && \
/opt/kibana/bin/dostart_caddy.sh >> /opt/qingcloud/app-agent/log/app.log
echo "[Restart] Caddy is restarted." >> /opt/qingcloud/app-agent/log/app.log
