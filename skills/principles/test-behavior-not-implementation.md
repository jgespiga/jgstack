# Test Behavior, Not Implementation

**When:** writing or reviewing tests.

A test is a claim about what the code does for its users (a caller, an end user, another service). Behavior is what they observe through their interface: return values, errors, state they can read back, and external effects (a request sent, a row written, a message emitted). Implementation is what they cannot observe: private helpers, internal call order, intermediate data.

Judge each test against two imagined edits:
- **Break the behavior** (wrong value, skipped or doubled effect). If the test still passes, it proves nothing. Usual causes: assertions looser than the contract, expected values computed by the code under test, restated constants that never run the code, asserting on data the test built itself.
- **Change the internals** while keeping every observable result. If the test fails, it is pinned to the implementation and catches no bug.

Keep tests that catch the first and survive the second; rewrite or delete the rest. Drive the code through its users' interface with concrete input. Derive expected values from the requirement, not from a run of the code. Assert what the contract promises, no less and no more.

The contract decides, not the assertion's shape:
- "An empty cart never charges" → asserting the payment client got no call is behavior. Pair it with a case where the charge happens, so the test shows it can see a call.
- The payload a mocked external service receives is behavior; a call to an internal helper is not.
- The error type callers branch on is the contract; an exact error message nobody reads is not.
- An invariant (a key present in two tables, a compile-time type check) is behavior too.
