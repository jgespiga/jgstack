# Minimize Reader Load

**When:** adding layers, wrappers, indirection, or state.

Maintainability is the work a reader must do to understand code. Track two independent axes: **layers to trace** (indirections between the question and the answer) and **state to hold** (hidden or mutable context to keep in mind). LOC and "clean architecture" are proxies; reader load is what matters.

- **Collapse layers** that cost more than they save: one-caller wrappers, adapters with no second implementation, speculative indirection. Inline them.
- **Each layer must change the abstraction.** A layer that repeats the same methods and arguments is a pass-through; collapse it.
- **Demand interface compression.** Prefer boundaries that hide meaningful decisions over broad interfaces that hide little.
- **Shrink state scope:** pure functions over mutations, locals over fields, fields over module state, module state over globals. Derive instead of sync.
- **Name the invariant at the boundary,** not in every consumer.
- Before adding a layer or state, ask: does it reduce reader load elsewhere by at least as much?

**Test:** can a new reader answer "where does X come from?" and "what can change X?" in under 30 seconds? If not, cut layers or state.
