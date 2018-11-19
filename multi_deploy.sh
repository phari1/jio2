#!/bin/bash

if [ $ENVIRONMENT = "QA" ];then
	for i in `cat IPs.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "santhu" scp target/jio.war santhu@$i:/home/santhu/soft/apache-tomcat-9.0.12/webapps
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "gamut" ssh santhu@$i "JAVA_HOME=/home/santhu/soft/jdk-10.0.2" "santhu/soft/apache-tomcat-9.0.12/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
fi
