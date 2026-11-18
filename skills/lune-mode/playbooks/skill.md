# Skill

Write or change an agent skill. A skill costs tokens every time it loads. Each line has to change what the agent does, or it goes.

## 1. Name the behavior

Say what the agent does wrong without the skill, or what it should do that it does not. Check that it really does: run the task once without the skill, or point to a session where it went wrong. If the agent already does it right, the skill is not needed.

Look through the existing skills first. Extending one beats adding a new one.

## 2. Encode it where it is cheapest

Read [encode-lessons-in-structure](../../principles/encode-lessons-in-structure.md). A rule that a script, lint, test, or check can enforce belongs there, not in prose.

## 3. Write it

Match the format of the skills around it: the frontmatter fields, file layout, and tone. Then:

- Tell the agent what to do. Give the reason only when the rule looks wrong or arbitrary without it.
- Put rarely needed detail in a separate file, and say when to read it.
- Link other skills and files by relative path. Do not restate them.
- Give a concrete example where an abstract rule would be misread.
- Use no harness tool names or model names unless the skill is for one harness.

Read [unslop](../../unslop/SKILL.md) and apply it to the text.

## 4. Check it

Check that the frontmatter has `name` and `description`, that `name` matches the folder, and that every linked file exists. Run the repo's own checks if it has any.

## 5. Try it

Run the skill on a real task in a fresh session. Watch where the agent skips a step, misreads a rule, or does extra work, and fix the line that caused it. Then cut any line the agent would follow just as well without.

## 6. Report

Follow the report rules in [lune-mode](../SKILL.md). Give the behavior the skill changes, what you tried it on, what you fixed after trying it, and its word count.
