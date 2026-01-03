# 19: Extract Specific Log Lines to File

## Goal
Monitor logs of a Pod and extract only the error lines matching a pattern.

## Requirements
- Pod name: `payment-api`
- Extract log lines that contain: `error file-not-found`
- Write them to: `/opt/CKA2026/payment-api/errors.log`
