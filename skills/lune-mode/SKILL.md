---
name: lune-mode
description: Route a coding task to one playbook (feature, bug, or review) and apply the principles each step needs. Explicit invocation only.
disable-model-invocation: true
---

# Lune mode

Pick one playbook for the task, say which in one line, then read that playbook and follow it. Read no other playbook.

| Playbook | When |
|---|---|
| `playbooks/feature.md` | Build or change behavior: a feature, a refactor, a migration |
| `playbooks/bug.md` | Something behaves wrong: a failure, a crash, a flaky test, a regression |
| `playbooks/review.md` | Judge a change someone else made: a diff, a branch, a PR |

If the user named a playbook, use it. If the task is a question or a change of a few lines, skip the playbooks. Answer or make the change, then verify it as [prove-it-works](../principles/prove-it-works.md) says.

## Rules for every playbook

- **Load on demand.** Playbooks name principle files at the steps that need them. Read a file when you reach its step, not before.
- **Ask only when the answer changes the work.** Otherwise state your assumption in one line and continue.
- **Stay in scope.** Do what was asked. Note anything else you find for the report, and leave it unchanged.
- **Report what happened.** Say what you verified and how. Say what you skipped or could not check.
