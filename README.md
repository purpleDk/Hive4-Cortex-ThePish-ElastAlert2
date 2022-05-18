# hive4-cortex-elastalert2-elk
Building a environment with elasticsearch, alerting with elastalert2, send that alerts to The Hive, analyse with cortex

If you want the default dashboards of the BEATS, you should run this commands on ubuntu machine:
filebeat setup --dashboards
metricbeat setup --dashboards
packetbeat setup --dashboards

If you have a Windowns computer or VM you can use ->
First you need to install winlogbeat on the linux computer or VM, on docker doesn't work
winlogbeat setup --dashboards

If you have a linux or VM computer you can use ->
First you need to install auditbeat on the linux computer or VM, on docker doesn't work
auditbeat setup --dashboards


The Hive | Cortex | ElastAlert2
Cortex
1, You need too create a new user on Cortex (example: api_user)
2, you need to generate an API KEY for that user
3, you need to put the API KEY on the CORTEX_KEY in the .env file, so that thehive can connect to the cortex

The hive & ElastAlert2
4, Create a new  new organization, and then a new user (example: api_elastalert2)
5, Generate API KEY  for that user
6, Insert the API KEY generated by thehive user and insert on elastalert2 config rules, on hive_apikey.



