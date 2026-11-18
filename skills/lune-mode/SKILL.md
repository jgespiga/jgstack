---
name: lune-mode
description: Route a coding task to one playbook and apply the principles each step needs. Explicit invocation only.
disable-model-invocation: true
---

# Lune mode

Start with one line that names the goal, the smallest change that meets it, and the playbook you picked. Then read that playbook and follow it. Read no other playbook.

| Playbook | When |
|---|---|
| `playbooks/feature.md` | Add or change behavior, including migrations |
| `playbooks/bug.md` | Something behaves wrong: a failure, a crash, a flaky test, a regression |
| `playbooks/refactor.md` | Change structure while behavior stays the same |
| `playbooks/perf.md` | Something is too slow or uses too much, by a number you can measure |
| `playbooks/investigate.md` | A question about the code, or "don't change anything yet" |
| `playbooks/review.md` | Judge a change someone else made: a diff, a branch, a PR |
| `playbooks/skill.md` | Write or change an agent skill |

If the user named a playbook, use it. If the task is a change of a few lines, skip the playbooks. Make the change, then verify it as [prove-it-works](../principles/prove-it-works.md) says. When the user starts a new task in the same session, pick again.

## Rules for every playbook

- **Load on demand.** Playbooks name principle files at the steps that need them. Read a file when you reach its step, not before.
- **Run it instead of asking.** If running a command, a test, or a small throwaway script would settle a question, run it. Make choices you can undo yourself, and say what you chose. Ask only for preferences that belong to the user, such as product scope or naming.
- **Stop before what you cannot undo.** Get approval before a force-push to a shared branch, a deploy, deleting data or files you did not create, or anything sent to people or services outside the session.
- **Stay in scope.** Do what was asked. Note anything else you find for the report, and leave it unchanged.
- **Say no when it is true.** When asked whether to do something, give your real judgment. "This is not worth doing" is a valid answer.

## Report

- Open with the goal from your first line, then what changed.
- Back each claim with evidence, or label it as inferred or a guess.
- Run every check you can yourself. Never leave the user one you could have run.
- Say what you skipped or could not check.
- Name each principle that changed a decision, and the decision it changed. Cite only principles you read in this session.
