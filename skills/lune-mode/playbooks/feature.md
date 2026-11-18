# Feature

Build or change behavior. A refactor or a migration is a feature whose behavior must stay the same.

## 1. Define done

Write down, in one or two lines, what will be true when the work is done and how you will check it. Prefer a check a script can run: a test, a command and its output, a request and its response.

## 2. Read before you change

Read the code you will touch and its callers. Then read its tests, types, and schemas, where most invariants live. Check the history of the files you will change:

- `git log --oneline -i -E --grep='revert|hotfix|incident' -- <path>` shows what broke before.
- `git log -L <start>,<end>:<file>` or `git blame`, then `git log -1 --format=%B <sha>`, gives the reason for a line that looks odd.

Docs and comments are claims. When they disagree with the code, the code wins. Stop reading when you can name what must stay true after your change. Keep these as working notes and do not write them up.

## 3. Shape the change

Read [subtract-before-you-add](../../principles/subtract-before-you-add.md) and [laziness-protocol](../../principles/laziness-protocol.md). Then read only the ones that fit:

- New core types or data: [foundational-thinking](../../principles/foundational-thinking.md), [model-the-domain](../../principles/model-the-domain.md), [type-system-discipline](../../principles/type-system-discipline.md).
- Input from outside, errors, framework wiring: [boundary-discipline](../../principles/boundary-discipline.md).
- State that is mutated, retried, or shared: [make-operations-idempotent](../../principles/make-operations-idempotent.md), [separate-before-serializing-shared-state](../../principles/separate-before-serializing-shared-state.md).
- Replacing an internal API: [migrate-callers-then-delete-legacy-apis](../../principles/migrate-callers-then-delete-legacy-apis.md).
- A new requirement the current design does not fit: [redesign-from-first-principles](../../principles/redesign-from-first-principles.md).

## 4. Build in checked steps

For more than one step, read [sequence-verifiable-units](../../principles/sequence-verifiable-units.md). Run the project's tests before you start, so you know which failures were already there.

When you write tests, read [test-behavior-not-implementation](../../principles/test-behavior-not-implementation.md). For a refactor, the existing tests are the contract. Get them passing before you change anything, and do not edit them to make the refactor pass.

## 5. Prove it

Read [prove-it-works](../../principles/prove-it-works.md). Run the check from step 1, then the full test suite, type checker, and linter the project uses. Read the diff once from top to bottom and remove debug code, stray edits, and anything the task did not need.

## 6. Report

Say what changed, how you checked it, and what you did not check. If the task includes text for people, such as docs, a README, or a PR description, read [unslop](../../unslop/SKILL.md) before you write it.
