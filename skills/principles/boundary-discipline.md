# Boundary Discipline

**When:** wiring validation, error handling, or framework adapters.

Validate, narrow types and handle errors at system boundaries. Trust internal code. Business logic lives in pure functions; the shell is thin and mechanical.

**Why:** scattered validation is noisy, redundant and gives false safety. Logic kept out of framework wiring can be tested without the framework.

- **At boundaries** (CLI args, config, external APIs, network): validate, return errors, be defensive. Parse raw data into domain types there.
- **Inside:** typed data, error propagation, no re-validation, no redundant nil checks deep in call chains.
- **Across the boundary:** expose domain concepts, not transport, storage, framework or wire types. General mechanism inside, special-purpose policy at the edge.
- **Pure core:** parsers (raw bytes → typed state), prompt builders (state → string) and scoring (state → result) are pure functions the shell calls.

**Tests:** "Is this data crossing a boundary right now?" If not, validation is redundant. "Can this be a pure function the shell calls?" If yes, extract it.
