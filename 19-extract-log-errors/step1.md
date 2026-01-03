## Tasks
1. Get logs from Pod `payment-api`
2. Filter for lines containing `error file-not-found`
3. Save matching lines to `/opt/CKA2026/payment-api/errors.log`

## Suggested approach
```bash
mkdir -p /opt/CKA2026/payment-api
kubectl logs payment-api | grep "error file-not-found" > /opt/CKA2026/payment-api/errors.log
```

## Verify
```bash
test -f /opt/CKA2026/payment-api/errors.log && echo "File exists"
wc -l /opt/CKA2026/payment-api/errors.log
head -n 5 /opt/CKA2026/payment-api/errors.log
```
