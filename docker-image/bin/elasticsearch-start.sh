PID=`ps -ef|grep -w Elasticsearch | awk '{print $1}'`

if [ -z "$PID" ]; then
    nohup /docker-entrypoint.sh elasticsearch &
fi
