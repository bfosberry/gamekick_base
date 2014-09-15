gamekick_base
=============

Base Dockerfile for gamekick repos

This Dockerfile installs wget, curl, chef, confd and etcdctl into /opt/etcd.

It also provides a run script, and some other tooling:

* run - application entrypoint
* get_info_value - retrieves an info value by key from etcd
* set_info_value - sets a keypair in etcd
* report_error - sets the error attribute and sets status to Errored