## Context
There are pods in namespace `echo` that expose port 9000. Only pods from one namespace should reach them.

## Goal
Create a NetworkPolicy allowing only a specific namespace to connect to port 9000.

## Requirements
- NetworkPolicy name: `allow-9000-from-team`
- Namespace where policy is created: `echo`
- Allow Pods in namespace: `team-app`
- Allow ingress only to port: `9000/TCP`
- Must be least permissive:
  - must NOT allow access from other namespaces
  - must NOT allow other ports
  - must NOT apply to pods that don't serve 9000 (select only correct pods)
