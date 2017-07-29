echo "[Start] Preparing for starting kibana..."
. /opt/kibana/bin/func.sh

PID=`ps -ef|grep -w kibana | grep -v "grep -w kibana"|awk '{print $1}'`
echo "[Start] Kibana pid is ${PID}."

if [ -z "$PID" ]; then
    echo "[Start] Starting kibana..."
    #urls=`grep -w "elasticsearch.url:" /opt/kibana/config/kibana.yml | awk '{print $2}' | awk -F"\"" '{print $2}'`
    #for url in $urls; do
    #    for i in {1..60..1}; do
    #        curl $url
    #        if [ $? -eq 0 ]; then
    #            echo "Test $url is successfully."
    #            break
    #        else
    #            if [ $i -ge 59 ]; then
    #                echo "Test $url is failed."
    #                break
    #            else
    #                echo "Test $url will retry after 2 seconds."
    #            fi
    #            sleep 2
    #        fi
    #    done
    #done
    nohup /opt/kibana/bin/kibana >> /opt/qingcloud/app-agent/log/app.log &
    waitport 127.0.0.1 5601
    echo "[Start] Kibana is started."
else
    echo "[Start] Kibana is already started."
fi

