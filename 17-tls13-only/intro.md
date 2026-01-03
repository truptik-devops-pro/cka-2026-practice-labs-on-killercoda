# 17: TLS Hardening (TLSv1.3 only)

## Goal
Restrict TLS to TLSv1.3 only and validate with curl.

## Requirements
- Namespace: `web`
- Deployment: `web-server`
- Service: `web-service`
- Hostname in `/etc/hosts`: `secure.demo.local`
- TLSv1.2 must fail; TLSv1.3 must succeed
