---
name: orient
description: Write a one-page HTML brief on an unfamiliar codebase or module, covering its parts, main flow, invariants, limitations, and key decisions. Explicit invocation only.
disable-model-invocation: true
---

# Orient

Write a one-page HTML brief that prepares an engineer to work in an unfamiliar codebase or module. It should take about five minutes to read. Change nothing in the target repo.

## 1. Set the scope

The scope is the path or module the user names, or the whole repo if they name none. State your interpretation in one line and continue. The user can redirect you.

Read from the conversation why they are here, such as a feature to add, a bug to fix, or a review. Put the depth where that work will land.

## 2. Gather evidence

Read in this order and stop once you can fill the brief.

1. README, docs, ADRs, design notes, CODEOWNERS.
2. Manifests, entry points, the directory tree, the public interface.
3. Types, schemas, database constraints, runtime checks, and tests. Most invariants live here.
4. History, using these commands:
   - `git log --format= --name-only -- <scope> | sort | uniq -c | sort -rn | head -20` lists the most-changed files.
   - `git log --oneline -i -E --grep='revert|hotfix|incident' -- <scope>` shows what has gone wrong.
   - `git log -1 --format=%B <sha>` and, when available, `gh pr view <number>` give the stated reasons for a change.
   - `git shortlog -sn --since=1.year -- <scope>` shows who to ask.

Trace the main flow through real code, from its trigger to its result. Pick the flow the user's work will touch, or the one that carries the most traffic.

Docs and comments are claims. Check them against the code. When they disagree, the code wins and the disagreement goes in the brief.

If the scope is too large to read without crowding your context, split it into 2 to 4 angles and use parallel subagents if your harness has them. Each one returns components, flow, boundaries, non-obvious things, and open questions, all with `path:line` references. Reconcile contradictions by reading the code yourself.

## 3. Write the body

Read [unslop](../unslop/SKILL.md) before you write.

Write only the body fragment to `~/.cache/jgstack/orient/<name>.body.html`, creating the folder if needed. `<name>` is `<repo>--<scope>` with slashes in the scope turned into dashes, or `<repo>` for a whole repo. Do not read `template.html`. The next step inserts the fragment into it.

| Section | Content |
|---|---|
| `what` | A few sentences on what it is, why it exists, and what it is not responsible for. For a module, who calls in and what it calls out to. |
| `map` | One component diagram, then one line per component. For a repo, components are services or packages. For a module, they are types and files. |
| `areas` | Whole project only. One row per area with what it does, who owns it, and when to go deeper. |
| `flow` | The main flow. When it has three or more parts, build it up over several diagrams, where each one redraws the last and adds to it. |
| `invariants` | What must stay true for the code to be correct, what enforces it, and what breaks without it. |
| `limitations` | What it cannot do, scale limits, and cases it does not handle. |
| `decisions` | Choices where a reasonable alternative existed and that still constrain the work. Skip framework defaults. |
| `start` | Files to read in order, then how to run and test it. |
| `open` | What you could not determine, and who to ask. |

Aim for about 800 words for a module, 1,500 for a subsystem, and 2,500 for a whole project, not counting diagrams. These are targets for a reader who has minutes to spend. Never pad to reach one.

Keep a row only if a newcomer could plausibly break that thing, or would work differently after reading it. Rank rows by how much harm a newcomer could do, worst first. If a section has nothing, write one row or line that says so and where you looked.

For a whole project, `invariants`, `limitations`, and `decisions` cover only what crosses areas. Each area's detail belongs in its own brief, which `/orient <area path>` writes.

Use exactly this markup, with each diagram on its own lines. Add the `areas` section after `map` when it applies, as a table with columns for area, what it does, owner, and when to go deeper.

```html
<h1>Name of the scope</h1>
<p class="meta">repo, path, commit sha, date</p>
<section id="what"><h2>What it is</h2><p>...</p></section>
<section id="map"><h2>Map</h2>
<pre class="diagram">
flowchart LR
  A["Label"] --> B["Label"]
</pre>
<ul><li><strong>Part.</strong> One line. <code class="ref">src/a.ts:12</code></li></ul>
</section>
<section id="flow"><h2>Main flow</h2><p>Trigger and result.</p>
<pre class="diagram">...</pre>
</section>
<section id="invariants"><h2>Invariants</h2><table>
<tr class="head"><th>Rule</th><th>Enforced by</th><th>If broken</th></tr>
<tr><td>...</td><td><span class="tag strong">test</span> <code class="ref">a.test.ts:8</code></td><td>...</td></tr>
</table></section>
<section id="limitations"><h2>Limitations</h2><table>
<tr class="head"><th>Limit</th><th>Consequence</th></tr>
<tr><td>...</td><td>...</td></tr>
</table></section>
<section id="decisions"><h2>Key decisions</h2><table>
<tr class="head"><th>Decision</th><th>Instead of</th><th>Why</th></tr>
<tr><td>...</td><td>...</td><td><span class="tag stated">stated</span> ... <code class="ref">docs/adr/1.md:4</code></td></tr>
</table></section>
<section id="start"><h2>Start here</h2><ol><li><code class="ref">src/a.ts</code> ...</li></ol><p>Run and test commands.</p></section>
<section id="open"><h2>Open questions</h2><ul><li>...</li></ul></section>
```

Escape `<`, `>`, and `&` as entities in all text and diagram source.

**Enforcement tags.** `strong` means a type, schema, constraint, test, or runtime check you can point at. `weak` means a convention, a comment, or nothing. Say which in the tag text, such as `test` or `nothing`.

**Decision tags.** `stated` means an author wrote the reason in a doc, comment, commit, or PR, and you cite it. `inferred` means it is your reading of the code or history, and you give that reasoning in one clause. `unknown` means you looked and found nothing, and you say where you looked.

**References.** Write file references as `<code class="ref">path:line</code>`, relative to the scope's folder, and give that folder in the `meta` line. Cite every invariant, limitation, and decision unless its tag is `unknown`. Never invent a reference, a reason, or a number.

**Diagrams.** Use Mermaid. Keep each diagram to 6 boxes and 8 words per box, and use plain words a person would say. When a system needs more boxes, draw another diagram of one part. Quote every label. Every box connects to something. A fact appears once, either in the picture or in the text.

**Voice.** Write in plain spoken English, the way you'd explain it to a colleague. Be tight, not terse. Cut filler and hedging, and keep the part that makes it click. State the concrete mechanism, not a metaphor, a framing, or a preview of what is coming. This is the target density: "Virtualization runs in two parts, one for rendering and one for loading from disk. When an item scrolls out past the buffer, both its DOM node and its in-memory data are evicted." Use sentence case. Use no em dashes. Prefer periods over commas, and keep each sentence to one or two commas. If clauses pile up, split them. Give each concept one name and keep it. Avoid mirror sentences ("A without B, or B without A") and tidy closers ("the rest follows", "it all falls out"). These directions are for you, so don't echo them as labels or stock phrases.

## 4. Check and build

Open every `path:line` you cited and confirm the line supports the claim. Check the body against each unslop pattern and fix what you find.

Then run this from this skill's folder, with an absolute body path.

```sh
sed -e '/<!-- BODY -->/{r <body>' -e 'd' -e '}' template.html > ~/.cache/jgstack/orient/<name>.html
```

## 5. Reply

Reply in at most four lines. Give the file path, the invariant most likely to bite this person, and where to start. Offer to go deeper on anything in the brief.
