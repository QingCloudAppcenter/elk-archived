ulimit -n 131070
ulimit -l unlimited
#sysctl -q -w vm.max_map_count=262144

mkdir -p /data/elasticsearch/data
mkdir -p /data/elasticsearch/logs
chown -R elasticsearch:elasticsearch /data/elasticsearch

PID=`ps -ef|grep -w Elasticsearch | grep -v "grep -w Elasticsearch"|awk '{print $1}'`

if [ -z "$PID" ]; then
    nohup /docker-entrypoint.sh elasticsearch &
fi
