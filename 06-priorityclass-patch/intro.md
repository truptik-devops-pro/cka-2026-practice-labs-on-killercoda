# 06: PriorityClass (highest - 1) + patch deployment

## Goal
Create a PriorityClass with value = (highest user-defined PriorityClass - 1) and patch a deployment to use it.

## Requirements
- Namespace: `production`
- Deployment: `logger-app`
- New PriorityClass: `critical-priority`
