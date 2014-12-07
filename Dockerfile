# Gamekick base repo
#
# VERSION 0.1

FROM ubuntu
MAINTAINER bfosberry

USER root
RUN apt-get update && apt-get -y install \ 
  wget \
  curl \
  build-essential \ 
  libxml2-dev \
  libxslt-dev

# install confd
RUN wget -O confd_0.3.0_linux_amd64.tar.gz https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz
RUN tar -zxvf confd_0.3.0_linux_amd64.tar.gz
RUN mv confd /usr/local/bin/confd
RUN rm confd_*.tar.gz

ADD ./scripts /opt/scripts

ENV PATH /opt/scripts/:$PATH
ENV DATA_FOLDER /opt/data/
RUN mkdir -p $DATA_FOLDER

ENTRYPOINT ["/opt/scripts/start.sh"]
