# Bug

Find why something behaves wrong and fix the cause. Read [fix-root-causes](../../principles/fix-root-causes.md) first.

## 1. Reproduce

Make the failure happen on demand before you change any code. The best reproduction is a failing test that states the expected behavior. Otherwise, use a command or script that shows the wrong output. Record the exact error and the input that triggers it.

If you cannot reproduce it, say so, and say what you tried. Then add logging or checks that would catch it next time instead of guessing at a fix.

## 2. Read before you change

Read the code on the failing path, from the trigger to where the wrong state shows up. Read its tests and types. Check the history of those files:

- `git log --oneline -- <path>` shows recent changes. A regression usually starts at one of them. When you have a known-good commit, use `git bisect run <repro>`.
- `git log -L <start>,<end>:<file>` or `git blame`, then `git log -1 --format=%B <sha>`, gives the reason for a line that looks odd.

Docs and comments are claims. When they disagree with the code, the code wins. Keep these as working notes and do not write them up.

## 3. Find the cause

Follow fix-root-causes until you reach the first wrong decision in the code. Read the actual state instead of guessing.

If two fixes that assume the same thing have failed, stop and read [attack-the-premise](../../principles/attack-the-premise.md) before trying a third.

## 4. Fix

Fix the cause, then search for the same fault elsewhere and fix those too. When a fix grows past a few lines, read [laziness-protocol](../../principles/laziness-protocol.md). When it touches input handling or errors, read [boundary-discipline](../../principles/boundary-discipline.md).

## 5. Prove it

Read [prove-it-works](../../principles/prove-it-works.md). The reproduction from step 1 must now pass. Run the full test suite. If the reproduction is a test, keep it, and check that it fails without the fix. When you commit, put the test first and the fix second, as [sequence-verifiable-units](../../principles/sequence-verifiable-units.md) describes.

## 6. Report

Say what the cause was, with `path:line`, what you changed, and the evidence that it is fixed. Name other places with the same fault, and say whether you fixed them.
