## Tasks
1. Install package via dpkg
2. Enable/start `cri-docker` service
3. Apply sysctl values and persist them

## Verify
```bash
dpkg -l | grep cri-dockerd
systemctl is-active cri-docker
sysctl net.bridge.bridge-nf-call-iptables net.ipv6.conf.all.forwarding net.ipv4.ip_forward net.netfilter.nf_conntrack_max
```
