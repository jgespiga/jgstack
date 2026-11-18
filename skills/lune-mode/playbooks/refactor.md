# Refactor

Change the structure of code while its behavior stays the same. A refactor is worth keeping only if the code is easier to follow afterwards. Read [minimize-reader-load](../../principles/minimize-reader-load.md) first. It is the measure for this whole playbook.

## 1. Lock in current behavior

Read the code and its callers until you know what they rely on. Then make sure a check fails if that behavior changes. Use the existing tests if they cover it. Otherwise, write tests that record what the code does now, through its public interface, before you move anything. Passing the type checker and linter does not count.

These tests record current behavior, bugs included. If you find a bug, note it and leave it. Fix it afterwards as a separate change with [bug.md](bug.md).

## 2. Name the target

Say what the structure should be if you were writing it today: the modules, the types, and who calls whom. Read [model-the-domain](../../principles/model-the-domain.md) when the code repeats conditionals or keeps booleans in sync. A good target removes branches, states, or layers. If yours adds a layer, it needs a reason in the report.

If the target changes behavior, it is a feature. Stop and use [feature.md](feature.md).

## 3. Delete first

Read [subtract-before-you-add](../../principles/subtract-before-you-add.md). Remove dead code, wrappers with one caller, and checks that can never fail before you build the new shape.

## 4. Move in small steps

Read [sequence-verifiable-units](../../principles/sequence-verifiable-units.md). Make one change at a time and run the tests after each. Never edit a test from step 1 to make a step pass.

- For an API change, move every caller and delete the old API in the same change, as [migrate-callers-then-delete-legacy-apis](../../principles/migrate-callers-then-delete-legacy-apis.md) says. Leave no old path running beside the new one.
- For renames and moves across many files, use the language tools or a script, as [build-the-lever](../../principles/build-the-lever.md) says. Then search for the old name as plain text. Strings, docs, config, and dynamic lookups keep it.

## 5. Prove it and judge it

Run the full test suite, type checker, and linter. For a large change, also compare outputs: run old and new code on the same inputs and diff the results.

Then read the old and new code side by side. If a reader cannot trace the code faster than before, revert the change and say why.

## 6. Report

Follow the report rules in [lune-mode](../SKILL.md). Name the structure that changed, the tests that held behavior in place, and what a reader no longer has to trace. List bugs you found and left.
