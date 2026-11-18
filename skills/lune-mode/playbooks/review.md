# Review

Judge a change someone else made. Change no code unless the user asks you to.

## 1. Get the change and its intent

Get the diff the user named: a branch against its base, a PR (`gh pr diff <number>`), or the uncommitted changes. Read the PR description, linked issues, and commit messages to learn what the change is meant to do. If you cannot tell, say what you assumed.

## 2. Read around the diff

A diff hides what it breaks. For each changed function or type, read its callers and the tests that cover it. Check whether the change keeps the invariants the old code relied on, and whether every caller still works with the new behavior.

## 3. Look for problems, worst first

1. **Correctness.** Wrong results, unhandled inputs or states, broken callers, races, data loss, security holes. For errors and input handling, read [boundary-discipline](../../principles/boundary-discipline.md). For shared or retried state, read [make-operations-idempotent](../../principles/make-operations-idempotent.md).
2. **Tests.** Read [test-behavior-not-implementation](../../principles/test-behavior-not-implementation.md). Check that the tests would fail if the new behavior broke, and that new behavior has tests.
3. **Design.** Read [minimize-reader-load](../../principles/minimize-reader-load.md) and [subtract-before-you-add](../../principles/subtract-before-you-add.md). Flag layers, options, or state the change did not need, and code that repeats something the codebase already has.

Skip style that a formatter or linter would catch.

## 4. Verify each finding

For every finding, write the concrete input or state that leads to the wrong result. Confirm it in the code. Run it when you can. Drop findings you cannot support, or mark them as questions.

## 5. Report

List findings worst first. For each one, give `path:line`, one sentence on the problem, the failure scenario, and a suggested fix. Then give a one-line verdict: ready to merge, merge after fixes, or needs rework. If nothing survived step 4, say so and say what you checked.
