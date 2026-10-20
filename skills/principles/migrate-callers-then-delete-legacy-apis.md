# Migrate Callers Then Delete Legacy APIs

**When:** introducing a new internal API while old callers still exist.

Migrate every caller and delete the old API in the same wave. Do not keep compatibility layers.

- Update tests to assert the new contract; delete tests that only protect pre-refactor implementation details.

**Applies only if:**
- No external users depend on backward compatibility.
- The project can absorb coordinated breaking changes.
- The new API is part of a simplification or refactor.
