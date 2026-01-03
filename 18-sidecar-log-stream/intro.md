# 18: Streaming Logs via Sidecar (Pod)

## Scenario
A legacy app writes logs to a file inside the container. You want the logs to be visible using `kubectl logs` by adding a streaming sidecar.

## Goal
Add a sidecar container to an existing Pod to stream a file-based log.

## Requirements
- Existing Pod name: `atlas-app`
- Sidecar container name: `log-sidecar`
- Sidecar image: `busybox:1.36`
- Sidecar command: `/bin/sh -c "tail -n+1 -F /var/log/atlas-app.log"`
- Use a shared Volume mounted at `/var/log` so the log file is available to the sidecar.
