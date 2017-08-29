#!/bin/bash

IMAGE_NAME=`echo $1 | awk -F: '{print $1}'`

case "${IMAGE_NAME}" in
        elasticsearch)
            OPTION="-v /data:/data"
            ;;

        kibana)
            OPTION=""
            ;;

        logstash)
            OPTION="-v /data:/data"
            ;;

        elasticsearch-head)
            OPTION=""
            ;;

        elastichd)
            OPTION=""
            ;;

        *)
            echo "Usage: $0 {elasticsearch|kibana|logstash|elasticsearch-head|elastichd}"
            exit 1
esac

. /opt/common/bin/func.sh

CTRID=`ctrid $1`

if [ -z "$CTRID" ]; then
    echo "[Start] Starting container ${1} ..."
    docker run --init -d --net host --privileged $OPTION dockerhub.qingcloud.com/qingcloud/${1}
    echo "[Start] Container based on ${1} is started successfully."
else
    echo "[Start] Container based on ${1} is already started."
fi

