# Investigate

Answer a question about the code. Change no files. The result is an answer, not a change.

## 1. Pin the question

Restate the question in one line. If it asks you to choose between options, list them.

## 2. Find the answer in the code

Read the code that answers it, and trace the path a real call takes through it. Run the code when that answers faster than reading, using a scratch folder outside the repo. For "why is it like this" questions, read the history: `git log -L <start>,<end>:<file>` or `git blame`, then `git log -1 --format=%B <sha>`, and `gh pr view <number>` when it is available.

Docs and comments are claims. When they disagree with the code, the code wins, and the disagreement goes in the answer. For a large search, read [guard-the-context-window](../../principles/guard-the-context-window.md).

## 3. Answer

Give the direct answer first, in one or two sentences. Then give the evidence, with a `path:line` for each claim. For a choice between options, add a table of the tradeoffs and recommend one. If the premise of the question is wrong, say so first.

Mark every claim you did not confirm in the code as inferred or a guess. If the answer will be saved or shared, read [unslop](../../unslop/SKILL.md) before you write it.

If the answer points to a change, say which playbook fits and stop. Make the change only after the user asks for it.
