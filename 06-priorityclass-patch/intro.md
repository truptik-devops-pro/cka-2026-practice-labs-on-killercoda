# Scheduling: PriorityClass from existing highest

**Goal:** Solve this scenario using `kubectl` and/or node tools (as required).

## Rules
- Treat this like the exam: minimal changes, verify results.
- Use the names given in this scenario (they may differ from common tutorials to keep the content unique).

## Task
Namespace: `itk-priority`

1) Create PriorityClass `itk-high` with value **(highest existing user-defined PriorityClass value - 1)**.
2) Patch Deployment `itk-logger` in namespace `itk-priority` to use `itk-high`.
