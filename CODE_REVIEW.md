# Code Review Guide

Use this guide for human or agent review of uncommitted changes, commits, and
pull requests. Establish the intended outcome from the request, issue, or work
plan before judging the implementation.

## Review priorities

Review in this order:

1. Correctness and regressions
2. Security, privacy, and unsafe data handling
3. Public API and supported-version compatibility
4. Missing or misleading tests
5. Packaging, documentation, and operational impact
6. Maintainability that materially affects future changes

Do not spend review attention on formatting that Ruff or another configured
tool handles automatically.

## Review method

1. Read the complete diff and inspect relevant surrounding code, not only the
   changed lines.
2. Trace important inputs, outputs, error paths, and platform-dependent paths.
3. Compare behavior with tests, documentation, and public API promises.
4. Run the narrowest command that can confirm or refute a suspected problem.
5. Check that generated files, lockfiles, and release-managed files changed only
   when the task requires them.
6. Finish with `just check` when proportional to the change, plus the additional
   commands required by `AGENTS.md`.

## Finding quality

Report only actionable findings caused by the change. Each finding should
include:

- **Priority:** `P0` critical, `P1` high, `P2` normal, or `P3` low
- **Location:** the smallest useful file and line range
- **Impact:** the concrete failure or risk and who or what it affects
- **Evidence:** the execution path, reproduction, test, or repository fact that
  supports the finding
- **Remediation:** a concise direction when the fix is not obvious

Avoid vague warnings, speculative failures without a reachable path, and style
preferences not enforced by the repository. Group findings that share one root
cause.

## Review output

Present findings first, ordered by priority. Then state:

- assumptions or questions that limit confidence;
- checks run and their results;
- residual risks or coverage gaps.

If there are no findings, say so explicitly and still report checks and
remaining test or review gaps. A clean review means no actionable issue was
found; it does not claim the change is risk-free.
