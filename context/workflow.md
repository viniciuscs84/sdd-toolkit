# Human x Agents SDD Workflow

This document defines how humans and agents collaborate in the SDD Toolkit.

## Central rule

Do not skip from idea directly to implementation.

Every meaningful change should move through human-guided clarification, specification, planning, execution coordination and explicit validation.

## Authority model

The human is the final authority for:

- product direction
- requirement approval
- scope decisions
- risk acceptance
- third-party skill adoption
- release readiness

Agents assist with clarification, writing, planning, recruiting, skill building, execution coordination, quality checks and documentation.

## Work modes

Before acting, identify the current mode:

```text
product clarification
context maintenance
specification writing
technical planning
agent recruitment
skill building
execution coordination
quality validation
documentation maintenance
```

## Role separation

### Human stakeholder

Approves product direction, requirement scope, major risks and release decisions.

### Product Owner

Clarifies product value, users, scope, priorities and acceptance direction with the human stakeholder.

The Product Owner owns product-context decisions but does not maintain the context files directly.

### Context Maintainer

Maintains the `context/` folder using approved or clearly sourced information.

It does not approve product decisions.

### Spec Writer

Writes formal SDD specifications from requirements approved by the Product Owner and the human stakeholder.

It does not approve requirements and does not plan implementation tasks.

### Tech Lead

Turns approved specs into waves and executable tasks.

It defines task scope, branch strategy, size, category, risks, validation expectations, required agents and gates.

It does not implement code.

### Agent Recruiter

Creates or configures project-specific implementation agents from `agent-blueprints/` when the active agents are not specific enough for the stack.

It does not implement project features.

### Skill Builder

Creates, adapts or recommends skills required by recruited agents.

It may use official documentation, web research and optionally skills.sh only when the user provides their own authentication token for the current task.

It does not recruit agents or implement project features.

### Orchestrator

Coordinates execution of planned tasks using active agents and recruited agents.

It does not implement code directly and does not bypass gates.

### Quality gate agents

Quality gate agents validate work from different perspectives:

- `review-specialist.md`: technical review and merge readiness.
- `testing-specialist.md`: tests and validation strategy.
- `acceptance-specialist.md`: acceptance criteria and product readiness.
- `cybersecurity-specialist.md`: security impact and residual risk.

### Docs Maintainer

Maintains human-facing documentation, guides, READMEs, release notes and workflow documentation.

It is different from Context Maintainer, which manages agent-facing operational context.

## Full workflow

```text
idea / issue / request
-> Product Owner clarifies with human
-> human approves requirement direction
-> Context Maintainer updates context when durable context changes
-> Product Owner calls Spec Writer
-> Spec Writer writes SDD specification
-> Tech Lead plans waves and tasks
-> Tech Lead calls Context Maintainer when planning reveals durable context
-> Tech Lead calls Agent Recruiter when stack-specific implementation agents are needed
-> Agent Recruiter calls Skill Builder when recruited agents need reusable skills
-> Skill Builder researches, recommends or drafts skills
-> Agent Recruiter finalizes recruited agents and skill assignments
-> Orchestrator coordinates task execution
-> Quality gate agents validate review, tests, acceptance and security
-> failed gates trigger correction cycles or replanning
-> human reviews meaningful outputs and risk decisions
-> Context Maintainer updates current state when relevant
-> Docs Maintainer updates human-facing documentation
-> wave or release is considered ready
```

## Requirement lifecycle

1. Human brings an idea, issue or request.
2. Product Owner clarifies product value, users, scope and acceptance direction.
3. Human approves the requirement direction.
4. Context Maintainer records durable product or business context when needed.
5. Spec Writer writes the formal specification.
6. Product Owner and human review the spec when product intent is sensitive or ambiguous.
7. Tech Lead plans waves and tasks from the approved spec.

## Agent recruitment lifecycle

1. Tech Lead identifies implementation domains required by the task plan.
2. Tech Lead calls Agent Recruiter when stack-specific implementation agents are needed.
3. Agent Recruiter reads project stack, architecture context and task plan.
4. Agent Recruiter selects the right blueprint from `agent-blueprints/`.
5. Agent Recruiter calls Skill Builder for required skills.
6. Skill Builder researches, recommends or drafts skills.
7. Agent Recruiter creates or configures recruited agents and assigns skills.
8. Orchestrator uses active and recruited agents during execution.

## Task lifecycle

1. Tech Lead defines executable tasks from a spec.
2. Each task receives size, category, expected validation, risks, dependencies and gates.
3. Orchestrator checks that the task is executable.
4. Orchestrator selects active or recruited agents.
5. Agents execute or review within their scope.
6. Quality gates are evaluated.
7. Failed gates trigger correction cycles.
8. Repeated failures or unclear scope return to Tech Lead for replanning.
9. Passed tasks move to human review when meaningful.
10. Context and documentation are updated when relevant.

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

Use `XS-doc-only` only when the task changes documentation, comments or Markdown text and does not alter executable code, configuration, permissions, security-sensitive behavior or public contracts.

Use `XS-safe-change` only when the task is local, low-risk and does not change public APIs, schema, migrations, auth, permissions, security, CI, business flow or shared contracts.

When risk is unclear, use `standard`.

## Quality gates

Every task must report four gates:

- `review`
- `tests`
- `acceptance`
- `security`

Allowed states:

- `passed`
- `failed`
- `not-applicable`, with justification
- `waived`, with justification

A task cannot be finalized while any gate is missing or failed.

## Minimum review checklist

- Scope was respected.
- Diff or change set is small and reviewable.
- Names, contracts and structure are clear.
- There are no opportunistic changes outside the task.
- Validation evidence is visible.

## Minimum testing checklist

- Automated tests were added or updated when viable.
- Relevant commands were executed or the limitation was documented.
- Regressions are covered when applicable.
- New behavior is covered at the right level.

## Minimum acceptance checklist

- Acceptance criteria were validated.
- Happy path was checked.
- Relevant error or edge scenarios were considered.
- Release risk was classified.
- Automation gaps were recorded.

## Minimum security checklist

- Security impact was evaluated.
- Sensitive data, credentials and logs were reviewed when applicable.
- Authorization remains deny-by-default when applicable.
- Residual risk was recorded.
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
- no simultaneous edits to central context, documentation or configuration
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
- data stores with sensitive data
- web/API surface area
- CI/CD or deployment behavior

## Context routing

Call Context Maintainer when work changes durable agent-facing context, such as:

- product goals or scope
- business rules
- architecture decisions
- stack or tool choices
- constraints
- glossary terms
- project current state
- superseded decisions

Do not use Context Maintainer to approve decisions. Use it to record approved or clearly sourced information.

## Documentation routing

Call Docs Maintainer when work changes human-facing documentation, such as:

- README files
- user guides
- contributor guides
- release notes
- public workflow documentation
- setup instructions

At the end of a wave, call Docs Maintainer before considering the wave ready when human-facing documentation changed.

## Response after task execution

After a task, the Orchestrator should report:

- task or issue reference
- wave reference
- task category
- what changed
- agents used
- recruited agents used, if any
- skills used or created, if any
- main files changed
- validation executed
- validation not executed and why
- quality gate status
- correction cycles used
- context updates needed or completed
- documentation updates needed or completed
- risks and pending items
- recommended next step
