gamekick_base
=============

Base Dockerfile for gamekick repos

This Dockerfile installs wget, curl, chef, confd and etcdctl into /opt/etcd.

It also provides a start script which calls scripts added by the child dockerfile:

* run - application entrypoint
* write_config - writes the application config
* install_components - installs any runtime modifications 
