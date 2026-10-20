---
name: principles
description: Engineering principles index. Explicit invocation only.
disable-model-invocation: true
---

# Principles

Each principle lives in its own file next to this one. Read only the ones you need.

- If the user named principles, read those files and apply them to the current task.
- Otherwise, pick the 1–3 whose **When** matches the current task, say which, then read and apply them.

| File | When |
|---|---|
| `fix-root-causes.md` | Debugging |
| `attack-the-premise.md` | Two or more fixes on the same premise failed |
| `prove-it-works.md` | Before claiming any task is done |
| `sequence-verifiable-units.md` | Multi-step work, sweeps, migrations |
| `subtract-before-you-add.md` | Evolving a system, adding features |
| `laziness-protocol.md` | Sizing a diff, tempted to add layers |
| `minimize-reader-load.md` | Adding layers, wrappers, or state |
| `foundational-thinking.md` | Before writing logic; choosing core types |
| `model-the-domain.md` | Growing conditionals, booleans in sync |
| `type-system-discipline.md` | Defining types, parsing external data |
| `boundary-discipline.md` | Validation, error handling, framework wiring |
| `test-behavior-not-implementation.md` | Writing or reviewing tests |
| `make-operations-idempotent.md` | Operations that mutate state, retries, crashes |
| `guard-the-context-window.md` | Large outputs, long files, fan-out |
| `explain-the-number.md` | Reporting a measured number (perf, evals) |
| `migrate-callers-then-delete-legacy-apis.md` | Replacing an internal API |
| `separate-before-serializing-shared-state.md` | Concurrent actors sharing state |
| `redesign-from-first-principles.md` | Integrating a new requirement into a design |
