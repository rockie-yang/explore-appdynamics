FROM debian:jessie

RUN apt-get update \
  && apt-get install -y git curl sed vim python-tk \
  && curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python \
  && pip install pandas pika appdynamics \  
  && apt-get clean autoclean \
  && apt-get autoremove -y --force-yes \
  && rm -rf /tmp/* \
  && rm -rf ~/.m2 ~/.npm ~/.cache \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY appdynamics.cfg /etc/
COPY ex2.py /root/
COPY perf.py /root

COPY run.sh /root/

RUN chmod a+x /root/run.sh

CMD ["/bin/bash"]