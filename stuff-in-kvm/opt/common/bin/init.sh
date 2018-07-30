#!/bin/bash

IMAGE_NAME=`echo $1 | awk -F: '{print $1}'`
BASE_OPTION="-v /etc/confd/confd.toml:/etc/confd/confd.toml"

case "${IMAGE_NAME}" in
        elasticsearch)
            OPTION="-v /data:/data"
            ;;

        kibana)
            OPTION=""
            ;;

        logstash)
            OPTION="-v /data:/data -v /opt/logstash/specifications:/opt/logstash/vendor/bundle/jruby/1.9/specifications -v /opt/logstash/gems:/opt/logstash/vendor/bundle/jruby/1.9/gems -v /opt/logstash/Gemfile.jruby-1.9.lock:/opt/logstash/Gemfile.jruby-1.9.lock"
            ;;

        elasticsearch-head)
            OPTION=""
            ;;

        elastichd)
            OPTION=""
            ;;

        cerebro)
            OPTION=""
            ;;

        elasticsearch-sql)
            OPTION=""
            ;;

        *)
            echo "Usage: $0 {elasticsearch|kibana|logstash|elasticsearch-head|elastichd|cerebro|elasticsearch-sql}"
            exit 1
esac

. /opt/common/bin/func.sh

CTRID=`ctrid $1`

if [ -z "$CTRID" ]; then
    echo "[Start] Starting container ${1} ..."
    docker run --init -d --net host --privileged $BASE_OPTION $OPTION dockerhub.qingcloud.com/qingcloud/${1}
    echo "[Start] Container based on ${1} is started successfully."
else
    echo "[Start] Container based on ${1} is already started."
fi

