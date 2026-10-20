# Type System Discipline

**When:** defining types, handling external data, or adding special-case handlers.

Make the compiler reject impossible states, mismatched primitives and unhandled variants. Define errors and special cases out of existence instead of adding handlers.

- **Brand semantic primitives.** `UserId` and `OrderId` may both be strings but must not be interchangeable: use a branded type or newtype. Validate once at creation, trust the type downstream.
- **External data is untyped until parsed.** RPC payloads, JSON, IPC, CLI args, config, env vars, DB rows: parse into the typed model at the boundary (`boundary-discipline.md`).
- **Derive types from authoritative schemas** (protobuf, OpenAPI, GraphQL, DB migrations, design tokens) instead of hand-rolling a parallel type.
