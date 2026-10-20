# Sequence Verifiable Units

**When:** multi-step work, sweeps, migrations, any run of similar edits.

Order work as small units, each ending in a state you can check. Do not advance until the current one is green.

**Why:** a break caught at the unit that caused it is cheap to localize. Caught after a batch, it is buried under work built on a broken base.

- **Execution:** known-good state → one change → run the check → proceed. Start from a clean baseline so every check measures against reality.
- **Delivery:** order commits so they prove the work: failing test first, then the fix; subtraction before the reshape; baseline before the treatment; scaffold before the feature. Each commit stands on its own.
