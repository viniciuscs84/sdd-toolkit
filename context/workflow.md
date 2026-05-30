# SDD Workflow

This document defines how agents should collaborate in a Specification-Driven Development workflow.

## Central rule

Before writing code, identify the current mode:

```text
product clarification
specification
technical planning
implementation
review
release/documentation
```

Do not skip from idea directly to implementation unless the task is explicitly trivial and safe.

## Role separation

### Product Owner

Clarifies value, scope, users, expected outcomes and acceptance criteria.

The Product Owner does not prescribe unnecessary implementation details.

### Tech Lead

Plans waves and tasks from an approved specification.

The Tech Lead does not implement code. It defines task scope, branches, complexity, gates, risks and required specialists.

### Orchestrator

Coordinates execution of planned tasks.

The Orchestrator does not implement code directly. It selects specialists, validates task risk, coordinates execution and makes sure quality gates are reported.

### Specialists

Specialists execute or review work within a focused area, such as architecture, C#, database, security, testing, QA, UX or documentation.

## Full flow

```text
idea / issue
-> product clarification
-> specification
-> wave planning
-> task planning
-> task execution
-> quality gates
-> human review
-> wave pull request
-> main branch
```

## Wave and task lifecycle

1. A spec is provided or created.
2. Product Owner clarifies value and acceptance criteria when needed.
3. Tech Lead plans waves from the spec.
4. Tech Lead breaks each wave into small tasks.
5. Each task receives complexity, category, expected validation and required agents.
6. Orchestrator receives executable tasks.
7. Orchestrator selects the right specialist agents.
8. Specialists execute or review within their scope.
9. Quality gates are evaluated.
10. Failed gates trigger correction cycles.
11. Passed tasks move to human review.
12. A wave PR is created after the wave is ready.

## Branching policy

Suggested branch names:

```text
wave/<wave-id>-<short-name>
wave/<wave-id>/task/<issue-number>-<short-name>
```

Suggested policy:

- Each wave has a branch based on `main`.
- Each task has a branch based on the wave branch.
- Task branches are integrated into the wave branch after gates pass.
- Task branches do not need their own PR unless the team prefers that.
- The wave PR is the formal review point for the batch of related work.

## Task size

Use this scale:

- `XS`: very small, local, low risk.
- `S`: small change in one area.
- `M`: moderate change affecting more than one file or concern.
- `L`: large change requiring careful decomposition.
- `XL`: too large for direct execution; split into waves or smaller tasks.

Do not send `XL` tasks directly to implementation.

## Task categories

Allowed categories:

- `standard`: normal full workflow.
- `XS-doc-only`: documentation-only change.
- `XS-safe-change`: local, very small, low-risk change.

Lightweight categories reduce checklist weight but do not remove quality gates.

### XS-doc-only

Use only when the task changes documentation, comments or Markdown text and does not alter executable code, configuration, permissions, security-sensitive behavior or public contracts.

### XS-safe-change

Use only when the task is local, low-risk and does not change public APIs, schema, migrations, auth, permissions, security, CI, solution files, business flow or shared contracts.

When risk is unclear, use `standard`.

## Quality gates

Every task must report four gates:

- `code-review`
- `tests`
- `qa`
- `security`

Allowed states:

- `passed`
- `failed`
- `not-applicable`, with justification
- `waived`, with justification

A task cannot be finalized while any gate is missing or failed.

## Minimum code review checklist

- Scope was respected.
- Diff is small and reviewable.
- Names, contracts and structure are clear.
- There are no opportunistic changes outside the task.
- The branch can be integrated with traceability.

## Minimum testing checklist

- Automated tests were added or updated when viable.
- Relevant commands were executed or the limitation was documented.
- Regressions are covered when applicable.
- New behavior is covered at the right level.

## Minimum QA checklist

- Acceptance criteria were validated.
- Happy path was checked.
- Relevant error scenarios were considered.
- Release risk was classified.
- Automation gaps were registered.

## Minimum security checklist

- Security impact was evaluated.
- Sensitive data, credentials and logs were reviewed when applicable.
- Authorization remains deny-by-default when applicable.
- Residual risk was registered.
- Cybersecurity review passed or was marked not applicable with justification.

## Correction loop limit

Default correction limit:

- initial execution
- correction 1
- correction 2

If any gate still fails after correction 2, stop and return the task to the Tech Lead as `blocked-needs-replanning`.

The Tech Lead should then review:

- ambiguous spec
- conflicting criteria
- oversized task
- technically unreachable condition
- missing Product Owner decision
- need to split the task

## Parallel execution

The Orchestrator may coordinate parallel tasks only after checking:

- no shared critical files
- no dependency between tasks
- no concurrent migrations or schema changes
- no simultaneous edits to central documentation or configuration
- no public API conflict
- independent branches can be integrated safely

When in doubt, do not parallelize.

## Security routing

Call the Cybersecurity Specialist at the beginning and end of tasks that may affect:

- authentication
- authorization
- permissions
- sensitive data
- configuration values
- logs and error messages
- databases with sensitive data
- web/API surface area

## Documentation routing

Tasks involving documentation should call:

- Testing Specialist, to validate commands, references and executable instructions when relevant
- Code Review Specialist, to review clarity, consistency and scope

At the end of a wave, call Documentation Maintainer before considering the wave ready.

## Response after task execution

After a task, the Orchestrator should report:

- task or issue reference
- wave reference
- branch names
- task category
- whether integration happened
- what changed
- agents used
- main files changed
- validation executed
- validation not executed and why
- quality gate status
- correction cycles used
- risks and pending items
- recommended next step
