# Collaborative Planning Guide

This is the repository's reusable planning template for human-agent work. Do
not replace this file with a task-specific plan. When a persisted plan is
useful, copy the appropriate template below to
`plans/<issue-or-date>-<short-name>.md`.

Plans are coordination aids, not fixed contracts. Keep them current when new
evidence changes the scope, approach, or acceptance criteria, and avoid
duplicating status that already has a clear source of truth in an issue or pull
request.

## Choose the lightest planning level

| Work type | Planning approach |
| --- | --- |
| Small and well-scoped | State the goal, relevant context, constraints, and what "done" means in the task request. No plan file is needed. |
| Ambiguous or medium-sized | Investigate first, agree on a short plan, then use the **Quick plan** template if the plan must persist. |
| Long-running, high-risk, or multi-session | Copy the **Execution plan** template and maintain decisions, checkpoints, progress, and evidence. |

## Working agreement

- The human owns the desired outcome, priorities, product decisions, and final
  acceptance.
- The agent owns repository investigation, implementation proposals, scoped
  changes, verification, and an evidence-based handoff.
- The agent may proceed with read-only investigation and reversible work that
  clearly falls within the agreed scope.
- The agent pauses when a missing decision could materially change the result,
  new authority is required, or an action is destructive or externally visible.
- Either collaborator may challenge an assumption. Important decisions belong
  in the plan or in an ADR when they are architecturally significant.
- Keep one execution step `in progress` unless independent parallel work is
  explicitly planned. Give parallel workers non-overlapping ownership.

---

# Quick plan template

Use this for bounded work that needs a durable shared plan but not a detailed
execution record.

## Summary

| Field | Value |
| --- | --- |
| Work item | [Short descriptive title] |
| Status | `draft` / `approved` / `in progress` / `blocked` / `complete` |
| Human owner | [Name or role] |
| Last updated | [YYYY-MM-DD] |
| Related issue/PR | [Link or `N/A`] |

## Outcome

- **Goal:** [Observable result, not implementation details]
- **Done when:** [Acceptance criteria and required evidence]
- **Non-goals:** [Related work deliberately excluded]
- **Constraints:** [Compatibility, safety, performance, or process boundaries]

## Approach

[Summarize the intended change and the important trade-off, if any.]

| Step | Owner | Status | Evidence |
| --- | --- | --- | --- |
| [Investigate or implement a bounded change] | Human / Agent | `not started` | [Finding, diff, or command result] |
| [Validate and review] | Human / Agent | `not started` | [Acceptance evidence] |

## Questions and decisions

- **Open:** [Question, owner, and when the answer is needed]
- **Decided:** [Decision and brief rationale]

## Handoff

- **Delivered:** [Behavior and files changed]
- **Validation:** `[command]` — [result]
- **Remaining:** [Known limitation, follow-up, or `None`]
- **Human acceptance:** `pending` / `accepted` / `changes requested`

---

# Execution plan template

Use this for work that spans sessions, carries meaningful risk, or requires
several human-agent checkpoints. Remove prompts and sections that do not apply.

## Plan summary

| Field | Value |
| --- | --- |
| Work item | [Short descriptive title] |
| Status | `draft` / `approved` / `in progress` / `blocked` / `complete` |
| Human owner | [Name or role] |
| Agent owner | [Agent/session identifier, if useful] |
| Created | [YYYY-MM-DD] |
| Last updated | [YYYY-MM-DD] |
| Related issue/PR | [Link or `N/A`] |

## Outcome and scope

### Goal

[Describe the user-visible or operational result in one or two sentences.]

### Success criteria

- [Observable condition that must be true]
- [Required behavior, compatibility, or quality level]
- [Required verification or review evidence]

### In scope

- [Component, behavior, or deliverable]

### Non-goals

- [Related work deliberately excluded]
- [Behavior or component that must remain unchanged]

### Constraints

- [Compatibility, security, performance, deadline, or dependency constraint]

## Context and evidence

[Summarize why the work is needed and link relevant issues, documentation,
code, logs, designs, or previous decisions. Distinguish verified facts from
assumptions.]

| Assumption | Evidence or reason | Impact if false | Owner to verify |
| --- | --- | --- | --- |
| [Current belief] | [Source or rationale] | [Required plan change] | Human / Agent |

## Open questions

Questions that do not block useful investigation may remain open while the
agent gathers evidence. Use `blocking` only when proceeding risks the wrong
outcome.

| Question | Owner | Needed by | Status or answer |
| --- | --- | --- | --- |
| [Missing decision or information] | Human / Agent | [Step or date] | `open` / `blocking` / [answer] |

## Proposed approach

[Describe the intended design and why it is appropriate. Include only
meaningful alternatives and trade-offs.]

### Expected files or components

- `[path/to/file]` — [expected change]
- `[path/to/test]` — [expected coverage]
- `[path/to/docs]` — [expected documentation change]

## Execution

Use `not started`, `in progress`, `blocked`, `done`, or `dropped`. Every
completed step should leave evidence.

| Step | Work | Owner | Status | Completion evidence |
| --- | --- | --- | --- | --- |
| 1 | Confirm current behavior and constraints | Agent | `not started` | [Findings or reproduction] |
| 2 | Resolve outcome-changing questions | Human + Agent | `not started` | [Recorded decisions] |
| 3 | Implement the smallest coherent change | Agent | `not started` | [Files or commit] |
| 4 | Add or update tests and documentation | Agent | `not started` | [Tests/docs changed] |
| 5 | Validate and review the diff | Agent | `not started` | [Commands and results] |
| 6 | Review against success criteria | Human | `not started` | [Approval or feedback] |

## Checkpoints and risks

Define checkpoints only where human judgment or authorization is genuinely
needed.

| Trigger | Human decision | Agent action while waiting |
| --- | --- | --- |
| Material design trade-off | Select the preferred outcome | Summarize evidence and recommendation |
| Required work exceeds scope | Approve, defer, or reject expansion | Stop expansion; finish safe in-scope work |
| External or destructive action | Explicitly authorize the exact action | Prepare and validate without executing |
| Final review | Accept or request in-scope changes | Present evidence and remaining risks |

| Risk | Likelihood/impact | Mitigation or fallback | Owner |
| --- | --- | --- | --- |
| [What could go wrong] | [Low/Medium/High] | [Prevention or recovery] | Human / Agent |

## Validation

Map validation directly to the success criteria and `AGENTS.md`.

- `[focused test command]` — [behavior covered]
- `[lint/type-check command]` — [quality covered]
- `[broader test/build command]` — [integration covered]
- [Manual or environment-specific check]

Before handoff, confirm:

- [ ] Every success criterion has evidence.
- [ ] Relevant tests, checks, documentation, and builds pass.
- [ ] The diff contains no unrelated changes or generated artifacts.
- [ ] Known limitations and checks not run are documented.

## Decisions and progress

For architecturally significant decisions, create an ADR and link it here.
Keep progress entries brief enough to support resuming work.

| Date | Type | Update | Owner/next action |
| --- | --- | --- | --- |
| [YYYY-MM-DD] | Decision / Progress | [Decision, evidence, or material change] | [Owner or next step] |

## Completion and handoff

- **Delivered:** [Behavior, files, documentation, or migration]
- **Verification:** `[command]` — [result]
- **Remaining work:** [Follow-up, known limitation, or `None`]
- **Human decision:** `pending` / `accepted` / `changes requested`
- **Notes:** [Acceptance notes or requested follow-up]
