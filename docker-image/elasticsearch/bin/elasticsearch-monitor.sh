#!/bin/bash

set -e

curl -XGET 127.0.0.1:9200/_nodes/stats
if [ $? -ne 0 ]
then
  exit 1
fi

echo "{\"mode\":\"$mode\",\"min\":$min,\"avg\":$avg,\"max\":$max,\"received\":$received, \"sent\":$sent,\"active\":$active,\"outstanding\":$outstanding,\"znode\":$znode}"
