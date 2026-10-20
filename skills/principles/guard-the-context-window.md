# Guard the Context Window

**When:** context is filling up: large outputs, long files, repeated reads, fan-out planning.

**Why:** context overflow degrades reasoning, creates compression artifacts and halts progress.

- **Size phases and cap scope.** Limit files per phase, set turn budgets, account for the cost of each mechanism.
- Route bulk work to subagents when available; keep summaries in the main thread, not raw payloads.
- Read only the part of a file you need; filter command output before it reaches context.
