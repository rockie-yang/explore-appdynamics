FROM debian:jessie

ENV APP_DYNAMICS_FILE controller_64bit_linux-4.3.1.1

# COPY ${APP_DYNAMICS_FILE}/${APP_DYNAMICS_FILE}.sh /root/
# COPY ${APP_DYNAMICS_FILE}/license.lic /root/

RUN apt-get update \
  && apt-get install -y net-tools zip git wget curl sed vim libaio1 libfreetype6 libfreetype6-dev libfontconfig  \
  && mkdir -p /home/appduser/AppDynamics/Controller 

COPY controller*.zip /root/controller.zip

COPY response.varfile /root/


RUN ls -alh /root/ \
  && unzip /root/controller.zip -d /root/controller \
  && mv /root/controller/license.lic /home/appduser/AppDynamics/Controller/ \
  && mv /root/controller/controller*.sh /root/controller/controller.sh


RUN  chmod +x /root/controller/controller.sh \
  && /root/controller/controller.sh -q -varfile /root/response.varfile

EXPOSE 8080

CMD [ "/bin/bash" ]