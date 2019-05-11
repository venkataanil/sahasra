#!/bin/bash

openstack overcloud deploy \
--timeout 180 \
--templates /usr/share/openstack-tripleo-heat-templates \
--stack overcloud \
--libvirt-type kvm \
--ntp-server clock.redhat.com \
-e /home/stack/virt/config_lvm.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/virt/network/network-environment.yaml \
-e /home/stack/virt/inject-trust-anchor.yaml \
-e /home/stack/virt/hostnames.yml \
-e /home/stack/virt/debug.yaml \
-e /home/stack/virt/nodes_data.yaml \
--environment-file /home/stack/networks-disable.yaml \
--environment-file /home/stack/network-environment.yaml \
--environment-file /home/stack/ips-from-pool-all.yaml \
--environment-file /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml \
-e ~/containers-prepare-parameter.yaml \
-n /home/stack/network_data.yaml \
--log-file overcloud_deployment_40.log
