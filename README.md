# jgstack

A small, token-efficient, harness-agnostic set of agent skills, inspired by
[pstack](https://github.com/cursor/plugins/tree/main/pstack).

Works with any agent that reads the open `SKILL.md` format (Claude Code, Codex, …),
and with any agent that can read files ("read `skills/lune-mode/SKILL.md` and follow it").

## Principles of the stack

- **Explicit only.** Skills run when you call them (`/lune-mode`, `/tdd`, …), never on
  every prompt. Each skill sets `disable-model-invocation: true`, so idle cost is ~zero.
- **One entry point.** `lune-mode` routes the task to a single playbook and pulls in
  other skills by relative path only when a step needs them.
- **Agnostic.** Plain markdown, relative paths, no harness tool names, no model names.

## Layout

```
skills/
├── lune-mode/        # the mode: router + playbooks/
├── principles/       # engineering principles, referenced by section name
└── <skill>/          # standalone skills, callable on their own
```

## Install

Coming soon: `install.sh` will symlink `skills/*` into each harness's global skills folder.
