# Gamekick base repo
#
# VERSION 0.1

FROM ubuntu
MAINTAINER bfosberry

RUN apt-get -y install wget curl build-essential libxml2-dev libxslt-dev
RUN curl -L https://www.opscode.com/chef/install.sh | bash

# install etcdctl
RUN wget https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz
RUN tar -xzf etcd-v0.3.0-linux-amd64.tar.gz
RUN mv etcd-v0.3.0-linux-amd64 /opt/etcd

