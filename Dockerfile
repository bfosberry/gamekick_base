# Gamekick base repo
#
# VERSION 0.1

FROM ubuntu
MAINTAINER bfosberry

USER root

RUN groupadd -r appuser && useradd -r -g appuser appuser

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

ENV PATH /opt/scripts/:$PATH

ENV DATA_FOLDER /opt/data/
RUN mkdir -p $DATA_FOLDER

RUN chown -R appuser:appuser /opt/data/
RUN chmod g+w /opt
RUN chown appuser:appuser -R /opt

USER appuser
ENV USERNAME appuser
ENV HOME /home/$USERNAME

ADD ./scripts /opt/scripts

ENTRYPOINT ["/opt/scripts/start.sh"]
