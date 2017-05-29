#!/bin/bash

cd /root/appagent/ver*/conf
sed -i 's/<controller-host>.*</<controller-host>xappdynamics</g' controller-info.xml
sed -i 's/<application-name>.*</<application-name>tomcat</g' controller-info.xml
sed -i 's/<tier-name>.*/<tier-name>tierTomcat</g' controller-info.xml
sed -i 's/<node-name>.*/<node-name>nodeTomcat</g' controller-info.xml

catalina.sh run
