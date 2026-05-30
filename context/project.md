# Project Context

This repository is a reusable Specification-Driven Development toolkit for human-guided, agent-assisted software delivery.

## Purpose

Help humans and AI agents transform ideas, issues and requirements into approved specifications, implementation plans, recruited project-specific agents, reusable skills, small tasks, quality reviews and testable outcomes.

## Core principle

The human remains the decision authority. Agents help clarify, document, plan, recruit, execute and validate work, but they do not replace human approval for product direction, scope, risk or release decisions.

## Context folder role

The `context/` folder stores agent-facing operational context.

Use it to reduce repeated explanations and prevent agents from making stale assumptions.

The Product Owner owns product-context decisions. Context Maintainer keeps the context folder accurate, concise and consistent.

## Context files

- `context/project.md`: high-level description of this toolkit and context model.
- `context/workflow.md`: official human x agents workflow for SDD work.
- `context/product.md`: product vision, goals, users and value proposition.
- `context/business-rules.md`: approved domain and business rules.
- `context/architecture.md`: relevant architecture decisions and boundaries.
- `context/stack.md`: technologies, frameworks, tools and runtime assumptions.
- `context/decisions.md`: decision log with date, reason, impact and source.
- `context/glossary.md`: domain terms and definitions.
- `context/constraints.md`: product, technical, legal, operational and security constraints.
- `context/current-state.md`: current known state of the project.

## Current work type

Always identify the current work type before acting:

```text
product clarification
context maintenance
specification writing
technical planning
agent recruitment
skill building
implementation coordination
quality validation
documentation maintenance
```

This distinction prevents planning agents from implementing code, implementation agents from expanding scope, and quality agents from approving unclear work.

## SDD mental model

A good SDD workflow makes work easier to review:

1. Clarify the problem with the human.
2. Approve product value, scope and acceptance direction.
3. Record durable context when needed.
4. Write a clear specification.
5. Plan implementation in waves and small tasks.
6. Recruit stack-specific agents when needed.
7. Build or recommend skills required by those agents.
8. Coordinate execution without bypassing gates.
9. Validate with explicit quality gates.
10. Record what changed, what was tested and what remains uncertain.

## Product vs specification vs implementation

Separate:

```text
Product intent
  why the change matters and how success is recognized

Operational context
  durable facts, constraints, decisions and current state that agents should reuse

Specification
  what behavior, constraints and acceptance criteria are expected

Implementation plan
  how work is split into waves, tasks, branches, agents and gates

Implementation
  how the system is changed to satisfy the specification

Validation
  how the team proves the change is acceptable
```

## Repository structure

```text
agents/             active agent definitions
agent-blueprints/   templates used to create stack-specific implementation agents
skills/             reusable skills for SDD tasks
context/            agent-facing operational context
README.md           public project overview
SECURITY.md         security and responsible-use guidance
```

## Maintenance focus

- Preserve traceability from requirement to spec to task to validation.
- Keep context concise and current.
- Avoid large unreviewable tasks.
- Keep agent responsibilities explicit.
- Prefer boring, predictable workflows over magic automation.
- Do not treat AI output as automatically correct.
- Explain uncertainty and validation gaps honestly.
