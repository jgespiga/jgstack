# Prove It Works

**When:** before claiming any task is done.

Verify every output by checking the real thing directly. Do not infer from proxies, self-reports, or "it compiles."

**Why:** unverified work has unknown correctness, and acting on a wrong inference costs far more than checking the source.

- Check process liveness directly, not through derived state.
- Read the actual value, not a cached or derived representation.
- When verification fails, suspect the observation method before the system.
- Prefer a deterministic script that reruns the check over a one-time eyeball. Run it and show its output, so a reviewer can rerun it instead of trusting your word.
