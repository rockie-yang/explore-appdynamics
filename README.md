# Explore AppDynamics

Download linux version of [AppDynamics](https://www.appdynamics.com/)

The Docker file is based on Debian

    docker build -t appdynamics .

    docker run -it appdynamics --name appdynamics -p 8088:8080 appdynamics

