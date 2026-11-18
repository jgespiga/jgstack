# Build the Lever

**When:** the same edit, check, or lookup repeats across many places or many runs.

Write the tool that does the work, then run it: a codemod, a script, a query, a generator. Do not repeat the work by hand.

**Why:** a tool applies the change the same way everywhere, and a reviewer can rerun it instead of reading every edit.

- Reach for the tool at the third repetition, or sooner when one missed case would be a bug.
- Prefer the language's own tools (rename, find references) over text search. Then search the plain text anyway, because strings, docs, and config keep old names.
- Make the tool print what it changed or found, so its run is the evidence.
- Keep the tool in the report or the commit, not just its output.
