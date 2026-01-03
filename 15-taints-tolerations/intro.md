# Scheduling: Taint node + toleration pod

**Goal:** Solve this scenario using `kubectl` and/or node tools (as required).

## Rules
- Treat this like the exam: minimal changes, verify results.
- Use the names given in this scenario (they may differ from common tutorials to keep the content unique).

## Task
1) Taint **node01** with `key=IT value=Kiddie effect=NoSchedule`.
2) Create a pod that tolerates this taint and lands on node01.

> If your environment doesn't have `node01`, use the worker node shown by `kubectl get nodes`.
