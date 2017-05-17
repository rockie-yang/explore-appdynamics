# Explore AppDynamics


## AppDynamics Server

Download linux version of [AppDynamics](https://www.appdynamics.com/)

The Docker file is based on Debian, if want use other distribution, it can be be modified accordingly

    docker build -t appdynamics .

    docker run -it appdynamics --name appdynamics -p 8090:8090 appdynamics
    
## Tomcat Sample Application

Download AppServerAgent for java and put into directory tomcat

    cd tomcat
    docker build -t tomcat .

