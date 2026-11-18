# Encode Lessons in Structure

**When:** you are about to write the same instruction, comment, or review note a second time.

Put the rule where it runs: a type, a lint, a test, a runtime check, a script. Prose is the last resort.

**Why:** a check fails every time the rule breaks. An instruction works only when someone reads it and remembers it.

- Pick the earliest place that can catch it: the type system, then a lint, then a test, then a runtime check.
- Make the failure message say what to do instead.
- When the rule cannot be checked, write it once, at the place it applies, and link to it from elsewhere.
- Delete the prose once a check enforces it.
