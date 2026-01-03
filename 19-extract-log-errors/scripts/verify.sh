#!/bin/bash
# Verify script for scenario 19

if [[ -f /opt/CKA2026/payment-api/errors.log ]]; then
  LINE_COUNT=$(wc -l < /opt/CKA2026/payment-api/errors.log)
  if [[ "$LINE_COUNT" -ge 1 ]]; then
    echo "PASS: Error log file exists with $LINE_COUNT lines"
    exit 0
  fi
fi
echo "FAIL: Error log file not found or empty"
exit 1
