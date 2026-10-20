# Separate Before Serializing Shared State

**When:** concurrent actors (processes, workers, agents) might share mutable state.

First ask whether they need the same mutable object. If not, eliminate the sharing. If sharing is real, enforce serialization structurally. Instructions and conventions are not concurrency control.

**Why:** races from concurrent writes are intermittent, hard to reproduce and expensive to debug.

1. **Identify shared mutable state:** files both read and write, branches both push to, APIs both define and consume.
2. **Default: eliminate the shared write target.** Give each actor its own file, key, branch or state directory, and merge only at the read/reporting boundary. Two workers writing their own field into one `state.json` is still shared mutation; `indexer-state.json` + `metrics-state.json` is not.
3. **Only when one shared target is a real invariant, serialize structurally:** lockfiles, sequential phases, single-writer actor, or atomic compare-and-swap. Treat "we need a lock" as a design smell to check, not the default.
