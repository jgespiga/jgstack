# Foundational Thinking

**When:** before writing logic: choosing core types and data structures, sequencing scaffold vs. feature work, deciding what concurrent actors share.

Structural decisions protect option value. Code-level decisions protect simplicity.

- **Data structures first.** Define core types early, trace every access pattern, and choose structures that match the dominant paths. Downstream code then becomes obvious.
- **DRY the structure, not every line.** Types and data models should converge; three similar statements still beat a premature abstraction. Prefer explicit over clever.
- **Concurrency:** before sharing state between actors, ask "what if another actor modifies this concurrently?" If the answer is not "nothing", isolate.
- **Scaffold first.** If something helps every later phase (CI, linting, test infra, shared types), do it first. Setup before features, tests before fixes. Keep commits small and single-purpose.
- Each increment should land a coherent abstraction or deepen an existing one, not spread a new capability across callers as special cases.
- Subtraction comes before scaffolding: remove dead code first, then lay foundations.
