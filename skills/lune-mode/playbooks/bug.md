# Bug

Find why something behaves wrong and fix the cause. Read [fix-root-causes](../../principles/fix-root-causes.md) first.

Every line you ship must trace to something you observed while the code ran. A change that "might help" is a guess, and a guess does not ship. When evidence rules out a guess, revert the code you wrote for it.

## 1. Reproduce

Make the failure happen on demand before you change any code. The best reproduction is a failing test that states the expected behavior. Otherwise, use a command or script that shows the wrong output. Record the exact error and the input that triggers it.

If it does not reproduce, narrow the conditions, build the triggering input yourself, or add logging until it does. Ask the user for help only after that, and say exactly what you could not reach.

## 2. Read before you change

Read the code on the failing path, from the trigger to where the wrong state shows up. Read its tests and types. Check the history of those files:

- `git log --oneline -- <path>` shows recent changes. A regression usually starts at one of them. When you have a known-good commit, use `git bisect run <repro>`.
- `git log -L <start>,<end>:<file>` or `git blame`, then `git log -1 --format=%B <sha>`, gives the reason for a line that looks odd.

Docs and comments are claims. When they disagree with the code, the code wins. Keep these as working notes and do not write them up.

## 3. Find the cause

List every cause that fits what you observed. Pick the check that rules out the most of them at once, run it, and cross off what it rules out. Read the actual state with logging, a debugger, or a printed value instead of guessing. Repeat until one cause is left, then confirm it by running the code: change the condition and watch the failure appear or disappear.

If two fixes that assume the same thing have failed, stop and read [attack-the-premise](../../principles/attack-the-premise.md) before trying a third.

## 4. Fix

Make the smallest change the evidence supports. Then search for the same fault elsewhere and fix those too. When the fix touches input handling or errors, read [boundary-discipline](../../principles/boundary-discipline.md).

Remove the logging you added in step 3, unless it would have shown this bug at first look. Then keep it and say why.

## 5. Prove it

Read [prove-it-works](../../principles/prove-it-works.md). The reproduction from step 1 must now pass. Run the full test suite. If the reproduction is a test, keep it, and check that it fails without the fix. When you commit, follow [commit](../../commit/SKILL.md), and put the test first and the fix second, as [sequence-verifiable-units](../../principles/sequence-verifiable-units.md) describes.

## 6. Report

Follow the report rules in [lune-mode](../SKILL.md). Give the cause with `path:line`, and paste the reproduction output from before and after the fix, unedited. Name other places with the same fault, and say whether you fixed them.
