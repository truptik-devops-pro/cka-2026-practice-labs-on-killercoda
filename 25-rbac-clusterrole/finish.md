## Congratulations!

You have successfully configured RBAC with namespace-scoped bindings.

### Key Takeaways
- ClusterRoles define permissions that can be reused across namespaces
- RoleBinding binds ClusterRole to subjects within a specific namespace
- This pattern is common for CI/CD pipelines with limited scope
- Use `kubectl auth can-i` to test permissions
