flag=1
sleep 5s
service nginx start

while [ $flag -eq 1 ];
do
    http_elastic=$(curl -s -o /dev/null --head -w "%{http_code}" -X GET "http://elasticsearch:9200")
    http_kibana=$(curl -s -o /dev/null --head -w "%{http_code}" -X GET "http://kibana:5601/api/status")

	if [[ $http_elastic -eq 200 ]] && [[ $http_kibana -eq 200 ]]; then
        flag=0;
        echo "Elasticsearch it's ready!"
        echo "Kibana it's ready!"
        
        sleep 5s; echo "Starting Heartbeat.................."
        heartbeat -e &
        sleep 15s; echo "Starting metricbeat.................."
        metricbeat -e &
        sleep 15s; echo "Starting packetbeat.................."
        packetbeat -e &
        sleep 15s; echo "Starting filebeat.................."
        filebeat -e &
            

       
	else
		echo "Elasticsearch not ready, code : ${http_elastic}"
        echo "Kibana not ready, code : ${http_kibana}"
        sleep 3s
	fi
done

sleep 15s;echo "All beats have been started!"
sleep infinity