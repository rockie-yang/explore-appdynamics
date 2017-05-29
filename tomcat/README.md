# Tomcat Sample Application

Download AppServerAgent for java and put into directory tomcat.

AppDynamics does not support OpenJDK, so the Dockerfile is modified using Oracle JDK. 

    cd tomcat
    docker build -t tomcat .

Get the IP address of the appdynamics server.

    APPDYNAMICS_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' appdynamics`

Run docker container, with the appdynamics entry resolve to the IP address of appdynamics server

    docker run -it -p 8080:8080 --add-host appdynamics:$APPDYNAMICS_IP --name tomcat tomcat