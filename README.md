# jgstack

A lightweight, token-efficient, harness-agnostic AI coding stack designed to produce high-quality
code fast, minimize AI-generated slop, and maintain high engineering standards.

My personal collection of agent skills and workflows, inspired by
[pstack](https://github.com/cursor/plugins/tree/main/pstack).

Works with any agent that reads the open `SKILL.md` format (Claude Code, Codex, ...),
and with any agent that can read files ("read `skills/lune-mode/SKILL.md` and follow it").

## Principles of the stack

- **Explicit only.** Skills run when you call them (`/lune-mode`, `/tdd`, ...), never on
  every prompt. Each skill sets `disable-model-invocation: true`, so idle cost is ~zero.
- **One entry point.** `lune-mode` routes the task to a single playbook and pulls in
  other skills by relative path only when a step needs them.
- **Agnostic.** Plain markdown, relative paths, no harness tool names, no model names.

## Layout

```
skills/
├── lune-mode/        # the mode: router + playbooks/
├── principles/       # SKILL.md index + one file per principle, loaded individually
└── <skill>/          # standalone skills, callable on their own
```

## Install

```sh
./install.sh              # symlink skills/* into ~/.claude/skills and ~/.agents/skills
./install.sh --uninstall  # remove only the links that point into this repo
```

Skills are symlinked, so edits in this repo take effect everywhere without reinstalling.
Re-run `install.sh` after adding a new skill. Existing folders with the same name are never
overwritten.

| Harness | Folder | Invoke |
|---|---|---|
| Claude Code | `~/.claude/skills` | `/lune-mode` |
| Codex | `~/.agents/skills` | `$lune-mode` |
| Other agents | — | "Read `<repo>/skills/lune-mode/SKILL.md` and follow it" |
