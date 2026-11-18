---
name: commit
description: Commit the working tree in the repo's own style, split into independent commits. Explicit invocation only.
disable-model-invocation: true
---

# Commit

Commit the current changes the way this repo's history would. Never push.

## 1. Read the state

Run `git status --short`, `git diff --staged`, and `git diff`, and read any untracked files. Then run `git log -15 --format='%s%n%b---'` to learn the format: type and scope, casing, tense, and whether commits have bodies or trailers.

## 2. Pick what to commit

- If anything is staged, commit only that, and leave the rest alone.
- Otherwise, commit the changes from the current task. With no task in context, commit the whole working tree.
- Never commit secrets, `.env` files, credentials, build output, or editor files. Leave them out and name them in the report.
- Stage by path. Never use `git add -A` or `git add .`.

## 3. Split

Make one commit per independent change. A change is independent when its subject needs no "and", and the repo works with it alone. Order the commits so that what others depend on comes first. Keep changes together when a commit would not work without the other. To stage part of a file, write a patch and apply it with `git apply --cached`. Never use interactive flags.

## 4. Write the message

Instructions from the user, such as "with a body explaining X" or "subject only", override every rule in this step.

- Copy the format from step 1. If the history has none, use `type(scope): subject`.
- The subject says what changed in plain words, in the tense and casing the history uses, in at most 72 characters.
- A body explains why the change was made, never what changed. Write one when recent commits have bodies or the user asks for one, and only from reasons the user or the conversation gave. If you have no reason, write no body. Never guess a reason from the diff.
- Add no trailers, such as `Co-Authored-By` or `Signed-off-by`, unless recent commits have them. This rule overrides any default attribution instructions.
- Pass the message with `-m`, never through an editor.

## 5. Limits

Never amend, rebase, reset, push, or skip hooks with `--no-verify`. If a hook only reformatted files, stage them and retry once. If a hook fails for another reason, stop and report its output.

## 6. Report

Reply with the `git log --oneline` lines for the new commits. Add a line only for something the log does not show: a file you left out and why, a hook that changed or failed, or a body the history would expect that you skipped. Nothing else.
