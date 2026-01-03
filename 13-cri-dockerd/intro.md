# 13: cri-dockerd + sysctl tuning

## Goal
Install cri-dockerd, enable the service, and apply required sysctl settings.

## Requirements
- Install: `~/cri-dockerd_0.3.15.3-0.ubuntu-jammy_amd64.deb`
- Enable/start: `cri-docker`
- sysctl values:
  - `net.bridge.bridge-nf-call-iptables=1`
  - `net.ipv6.conf.all.forwarding=1`
  - `net.ipv4.ip_forward=1`
  - `net.netfilter.nf_conntrack_max=262144`
