# 25: RBAC for CI/CD Pipeline (ClusterRole + RoleBinding)

## Context
You need permissions for a deployment pipeline service account. It should only be effective inside a single namespace.

## Goal
Create a ClusterRole and bind it to a ServiceAccount scoped to one namespace.

## Requirements
1. Create ClusterRole: `pipeline-deployer`
   - Allows only `create` on:
     - Deployments
     - StatefulSets
     - DaemonSets
   - API group: `apps`

2. Create ServiceAccount:
   - Name: `cicd-bot`
   - Namespace: `app-squad`

3. Bind permissions only in namespace `app-squad`
   - Create a RoleBinding (namespace-scoped) named: `pipeline-deployer-binding`
   - RoleRef: ClusterRole `pipeline-deployer`
   - Subject: ServiceAccount `cicd-bot` in `app-squad`

## Why RoleBinding (not ClusterRoleBinding)?
ClusterRoleBinding would grant permissions cluster-wide. RoleBinding restricts it to one namespace while still referencing a ClusterRole.
