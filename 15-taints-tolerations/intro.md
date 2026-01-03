# 15: Taints & Tolerations

## Goal
Reserve a node so normal pods can't schedule, then schedule a pod with toleration on that node.

## Requirements
- Node: `worker-node01`
- Taint: key=`Env`, value=`Production`, effect=`NoSchedule`
- Pod name: `prod-pod` must land on `worker-node01`
