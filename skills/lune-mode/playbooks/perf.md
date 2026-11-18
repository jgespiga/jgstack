# Perf

Make something faster or lighter, proven by a number. Read [explain-the-number](../../principles/explain-the-number.md) first, and apply it to every number in this playbook.

## 1. Name the metric

Say what you measure, such as latency, throughput, memory, or build time, on what input, and what value counts as done. Use an input the size of real use. If the user gave no target, propose one and continue.

## 2. Measure the baseline

Write a script that runs the measurement and prints the result, so every later run uses the same conditions. Run it several times and record the median and the spread. Check that the measured code does the real work, with no errors, cache hits, or skipped paths.

## 3. Find where the cost goes

Profile it. Use a profiler, timers around the suspect parts, or system counters. Reading source code tells you where to look. Only a measurement tells you where the cost is. Name the part that limits the number before you change anything.

## 4. Fix the cheapest way first

Try these in order and stop once the target is met:

1. Remove work whose result nothing uses.
2. Stop repeating work: cache it, or hoist it out of the loop.
3. Do less of it: batch calls, load less data, pick a better algorithm.
4. Do it later, or only when needed.
5. Move it off the path the user waits on, or run it in parallel.
6. Make the remaining work cheaper.

Change one thing at a time and measure after each change, with the script from step 2. Revert any change that does not move the number beyond the spread.

## 5. Prove it

Read [prove-it-works](../../principles/prove-it-works.md). Run the full test suite to show behavior did not change. Run the measurement again on the final code.

## 6. Report

Follow the report rules in [lune-mode](../SKILL.md). Give the baseline, the result, the change, the run count and spread, the part that limited the number, and the path to the measurement script.
