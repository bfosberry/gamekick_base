# Gamekick base repo
#
# VERSION 0.1

FROM ubuntu
MAINTAINER bfosberry

RUN apt-get update
RUN apt-get -y install wget curl build-essential libxml2-dev libxslt-dev lsyncd

#install chef
RUN curl -L https://www.opscode.com/chef/install.sh | bash

# install etcdctl
RUN wget https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz
RUN tar -xzf etcd-v0.4.6-linux-amd64.tar.gz
RUN mv etcd-v0.4.6-linux-amd64 /opt/etcd
RUN rm etcd_*.tar.gz

# install confd
RUN wget -O confd_0.3.0_linux_amd64.tar.gz https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz
RUN tar -zxvf confd_0.3.0_linux_amd64.tar.gz
RUN mv confd /usr/local/bin/confd
RUN rm confd_*.tar.gz

ADD ./scripts /opt/scripts

ENTRYPOINT ["/opt/scripts/start.sh"]
