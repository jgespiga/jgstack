# Make Operations Idempotent

**When:** writing anything that mutates state: commands, lifecycle operations, processing loops, scripts.

Operations must converge to the correct state however many times they run and wherever the previous run stopped.

**Why:** crashes, restarts and retries are normal. If partial state changes the next run's outcome, every restart becomes a debugging session.

- Derive each step from the state that exists, not from what the previous run meant to do: read current state, compare to the goal, apply only the difference.
- Anything a run leaves behind (lock, temp file, half-written record, claimed job) must be recognizable as stale by the next run, using evidence that holds wherever the previous run stopped. E.g. write to a temp path and rename into place; compare artifacts by content, not creation order.

**Test:**
1. What happens if this runs twice in a row?
2. What happens if the previous run crashed at every possible point?
3. Does re-execution converge to the same end state?

If any answer is "it depends on what was left behind", add a reconciliation step.
