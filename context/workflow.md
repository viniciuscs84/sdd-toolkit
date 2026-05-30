# Human x Agents SDD Workflow

This document defines how humans and agents collaborate in the SDD Toolkit.

## Central rule

Do not skip from idea directly to implementation.

Every meaningful change should move through human-guided clarification, environment setup, specification, planning, execution coordination and explicit validation.

## Authority model

The human is the final authority for:

- product direction
- requirement approval
- scope decisions
- technical details that are not already defined
- AI platform and environment decisions
- model routing decisions when availability or cost is unclear
- risk acceptance
- third-party skill adoption
- release readiness

Agents assist with clarification, environment setup, writing, planning, recruiting, skill building, execution coordination, quality checks and documentation.

## Human-facing agents

Humans may interact directly with:

- `product-owner.md` for project setup, product clarification, requirement approval flow and readiness checks.
- `env-configr.md` for development environment, AI platform, model routing, setup scripts and communication rules.
- `tech-lead.md` for technical planning, wave/task planning, dependency validation and project/task-management consistency.
- `orchestrator.md` for execution coordination of planned tasks or explicit human-approved ad hoc tasks.

All other active agents are subagents.

## Communication rules

- Inter-agent communication defaults to English.
- Specialized agents communicating with models should use the `caveman` skill by default to reduce token usage while preserving technical accuracy.
- Human interaction must adapt to the human's language.
- Human-facing artifacts must follow the language expected by the human or project context.
- Do not force English for human-facing artifacts unless the project explicitly requires it.
- Do not use caveman compression with humans unless the human explicitly asks for it.

## Work modes

Before acting, identify the current mode:

```text
project setup
environment configuration
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

Approves product direction, requirement scope, missing project definitions, environment decisions, major risks and release decisions.

### Product Owner

Asks the human the questions needed to configure the project, clarifies product value, identifies definition gaps and calls subagents to record approved setup work.

The Product Owner owns product-context decisions and must notify the human when the project is ready to start execution planning.

The Product Owner must not infer technical details. Undefined technical details must be asked to the human or routed to the Tech Lead.

During early project setup, Product Owner calls Env Configr when environment, AI platform, model routing or communication rules are undefined.

### Env Configr

Configures development environment and AI-agent environment with the human or Product Owner.

It handles AI platform selection, setup script guidance, model routing, communication rules and environment-specific instructions for Agent Recruiter and Skill Builder.

It must not guess models, subscription features, platform capabilities or credentials.

### Context Maintainer

Maintains the `context/` folder using approved or clearly sourced information.

It does not approve product decisions.

### Spec Writer

Writes formal SDD specifications from requirements approved by the Product Owner and the human stakeholder.

It does not approve requirements and does not plan implementation tasks.

### Tech Lead

Interacts with humans to plan approved specs into coherent waves and executable tasks.

It validates dependencies, required agents, required skills, task order and consistency with project/task-management systems.

To execute a planned task, it calls the Orchestrator with the task details.

The Tech Lead does not implement code.

### Agent Recruiter

Creates or configures project-specific implementation agents from `agent-blueprints/` when the active agents are not specific enough for the stack.

It receives environment/platform instructions from Env Configr when environment-specific configuration exists.

It does not implement project features.

### Skill Builder

Creates, adapts or recommends skills required by recruited agents.

It may use official documentation, web research and optionally skills.sh only when the user provides their own authentication token for the current task.

It receives environment/platform instructions from Env Configr when environment-specific configuration exists.

It does not recruit agents or implement project features.

### Orchestrator

Coordinates execution of planned tasks received from the Tech Lead and explicit human-approved ad hoc tasks.

It identifies agents capable of executing the task, calls them, coordinates execution, enforces document consistency and ensures quality gates are followed.

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
-> Product Owner asks project setup and product clarification questions
-> Product Owner identifies definition gaps
-> Product Owner calls Env Configr for environment, AI platform, model routing and communication setup
-> human provides or approves missing definitions
-> Context Maintainer records approved context when durable context changes
-> Env Configr calls Agent Recruiter and Skill Builder with environment/platform instructions when needed
-> Product Owner calls Spec Writer after requirement approval
-> Spec Writer writes SDD specification
-> Tech Lead verifies spec, stack, agents and skills before planning
-> Tech Lead plans waves and tasks with coherent dependencies
-> Tech Lead syncs milestones/tasks through project-management specialist when integration exists
-> Tech Lead calls Agent Recruiter when stack-specific agents are needed
-> Agent Recruiter calls Skill Builder when recruited agents need reusable skills
-> Skill Builder researches, recommends or drafts skills
-> Agent Recruiter finalizes recruited agents and skill assignments
-> Tech Lead calls Orchestrator with task execution details
-> Orchestrator identifies capable agents and coordinates task execution
-> Orchestrator enforces document consistency and quality gates
-> Quality gate agents validate review, tests, acceptance and security
-> failed gates trigger correction cycles or replanning
-> human reviews meaningful outputs and risk decisions
-> Context Maintainer updates current state when relevant
-> Docs Maintainer updates human-facing documentation
-> wave or release is considered ready
```

## Ad hoc orchestration

The Orchestrator may receive explicit human-approved ad hoc tasks.

Ad hoc tasks must not bypass product or technical governance. If the task changes product scope, architecture, security, data model, release behavior or durable context, the Orchestrator must route it to Product Owner or Tech Lead before execution.

Small operational tasks may proceed when scope, risk, expected result and validation are clear.

## Project/task-management integration

When a project-management system is configured, the Tech Lead must keep milestones, waves, tasks and dependencies consistent with the approved plan.

The Tech Lead should call a recruited project-management specialist to update or validate work items, statuses, dependencies, milestones, owners and links to specs, branches and pull requests.

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

## Mandatory rules

- Product Owner, Env Configr, Tech Lead and Orchestrator are available to humans.
- All other active agents are subagents.
- Product Owner must ask for missing project definitions and must not infer technical details.
- Product Owner must call Env Configr during early project setup when environment, AI platform, model routing or communication rules are undefined.
- Product Owner must notify the human when the project is ready for execution planning.
- Env Configr must not guess models, subscription features, platform capabilities or credentials.
- Env Configr must pass environment and platform instructions to Agent Recruiter and Skill Builder when they are called.
- Inter-agent communication must default to English.
- Agents should use the `caveman` skill for inter-agent and specialized model communication by default.
- Human interaction and human-facing artifacts must adapt to the human's language.
- Tech Lead must not plan work outside the approved spec.
- Tech Lead must not start planning until stack, required agents and required skills are defined or explicitly not needed.
- Tech Lead must keep task dependencies consistent and coherent.
- Tech Lead must call Orchestrator to execute planned tasks.
- Orchestrator must identify capable agents and call them.
- Orchestrator must enforce document consistency and quality gates.
- Every task must report `review`, `tests`, `acceptance` and `security` gates.
