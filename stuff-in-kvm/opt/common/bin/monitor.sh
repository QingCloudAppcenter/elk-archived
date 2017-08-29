#!/bin/bash

. /opt/common/bin/func.sh

CTRID=`ctrid $1`

IMAGE_NAME=`echo $1 | awk -F: '{print $1}'`

[ -n "${IMAGE_NAME}" ] && docker exec $CTRID /opt/${IMAGE_NAME}/bin/monitor.sh
