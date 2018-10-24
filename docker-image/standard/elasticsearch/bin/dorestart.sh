#!/bin/bash

set -e

. /opt/elasticsearch/bin/func.sh

log "[Restart] Restarting elasticsearch..."
/opt/elasticsearch/bin/dostop.sh
sleep 3
/opt/elasticsearch/bin/dostart.sh
log "[Restart] Elasticsearch is restarted."
