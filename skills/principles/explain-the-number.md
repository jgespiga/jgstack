# Explain the Number

**When:** before you trust, report or act on a measured number: a speedup, regression, throughput, latency or eval result.

- **Ask "why not double?"** Name the resource or code path that bounds the result (a core, a lock, the disk, the network, the load generator). Get it from a profile or system counters taken during a run, then map it to source. A guess from reading code is not a limiter.
- **List what else the number could be measuring and rule each out with evidence:** errors, skipped or cached work, code that never ran, an untuned side left on defaults, noise, a piece too small to matter end to end.
- **Keep the evidence with the number:** run count, spread and the named limiter.
- For eval results: did every run do the task, does the gap hold across trials, does the scenario matter?

You skipped this when a number has no run count, no spread or no named limiter, or when the time saved exceeds the time the changed piece took.
