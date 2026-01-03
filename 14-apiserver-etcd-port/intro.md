## Scenario
After migration, kube-apiserver points to etcd peer port 2380 instead of client port 2379.

## Goal
Fix kube-apiserver etcd endpoint to use port 2379.
