# Fix Root Causes

**When:** debugging.

Fix the fault, not the place where it surfaced. The symptom is where a wrong state became visible. The root cause is the first place the system did something it should not do, or failed to handle a state it should handle.

**Why:** a symptom fix hides the evidence and leaves the fault free to surface elsewhere, as an unnamed workaround.

- Reproduce first.
- Ask "why" at each step until the answer is a wrong decision in the code, not a consequence of an earlier one.
- When stuck, instrument. Read the actual error and the actual state. Do not guess.
- Ask whether the triggering state is legitimate. If it is, the code that broke on it is the root cause; handle it there. If it should never exist, a check where it broke hides the bug; find what produced the state. Guards, retries, swallowed errors, clamped values and discarded state are the usual ways to hide a bug.
- Fails only after a restart: suspect persisted state first (config, caches, lock files, serialized state).
- Fix the pattern, not just the instance. Find every place with the same fault.
- A workaround that needs a paragraph-long comment means the code is wrong. Fix the code.
- If the deciding fact took a deep dig to find, propose a cheap, always-on signal that would have shown it at first look.
