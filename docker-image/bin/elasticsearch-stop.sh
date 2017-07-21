PID=`ps -ef|grep -w Elasticsearch | awk '{print $1}'`

if [ -n "$PID" ]; then
    kill -SIGTERM $PID
fi
