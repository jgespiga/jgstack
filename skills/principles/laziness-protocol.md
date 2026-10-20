# Laziness Protocol

**When:** refactoring, sizing a diff, or tempted to add abstractions, layers, or signal threading.

Bias toward deletion and the smallest change that solves the problem.

- **Consolidate decisions.** Do not repeat the same choice in several places. Put it behind one source of truth and pass the result as a simple flag.
- **Minimize the diff.** Fewer lines beat "elegant" boilerplate.
