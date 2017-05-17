#!/bin/bash

cd /root/appagent/ver*/conf
sed -i 's/<controller-host>172.17.0.3/<controller-host>appdynamics/g' controller-info.xml
sed -i 's/<application-name>/<application-name>appName/g' controller-info.xml
sed -i 's/<tier-name>/<tier-name>tierName/g' controller-info.xml
sed -i 's/<node-name>/<node-name>nodeName/g' controller-info.xml


catalina.sh run

