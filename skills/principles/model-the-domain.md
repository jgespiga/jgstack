# Model the Domain

**When:** a feature grows an if/else chain, adds a boolean that must stay in sync with another, or splits logic into phase-named steps.

Encode the real domain in a data structure instead of scattering it across conditionals. A matching structure makes invalid states unrepresentable and deletes branches. Choosing it now is cheap; recovering it later becomes a deferred refactor.

Reach for:
- A state machine instead of scattered booleans, phases or lifecycle checks.
- A typed model instead of loose parameters or repeated shape assumptions.
- A map, registry, lookup table or discriminated union instead of branching spread across files.
- A reducer or command/event model instead of ad hoc mutations.
- Modules organized around one body of domain knowledge, not a sequence like load → validate → transform → save. Execution order is not ownership.
- A queue, cache, index, graph or normalized collection where the access pattern calls for it.
- When nothing fits: work out what the code must never allow and how data is read, then pick the structure that encodes exactly that.

Do not force it. Prefer boring code when the current shape is clear, local and unlikely to grow. Reject abstractions that add indirection without removing branches, duplicated rules, invalid states or lifecycle risk.
