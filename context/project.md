# Project Context

This repository is a reusable Specification-Driven Development toolkit.

## Purpose

Help humans and AI agents transform ideas, issues and requirements into clear specifications, implementation plans, small tasks, quality reviews and testable outcomes.

## Core distinction

Always distinguish the current work type:

```text
Am I clarifying product value?
Am I writing or reviewing a specification?
Am I planning waves and tasks?
Am I executing a technical task?
Am I reviewing quality, tests, security or documentation?
```

This distinction prevents planning agents from implementing code, implementation agents from expanding scope and review agents from approving unclear work.

## Recommended repository structure

```text
docs/specs/          product and technical specifications
docs/tasks/          wave and task plans
src/                 production code
tests/               automated tests
.opencode/agents/    specialist agent definitions
.opencode/context/   operational context for agents
```

Adapt this structure to the target project when necessary.

## SDD mental model

A good SDD workflow should make work easier to review:

1. Clarify the problem.
2. Define expected user or system value.
3. Write acceptance criteria.
4. Plan implementation in small tasks.
5. Execute only one focused task at a time.
6. Validate with explicit quality gates.
7. Record what was changed, tested and left uncertain.

## Product vs implementation

Separate:

```text
Product intent
  why the change matters and how success is recognized

Specification
  what behavior, constraints and acceptance criteria are expected

Implementation
  how the system is changed to satisfy the specification

Validation
  how the team proves the change is acceptable
```

## Documentation rule

Prefer one root README for the repository. Use explicit file names for specific documents, for example:

- `project.md`
- `workflow.md`
- `agent-catalog.md`
- `solution-overview.md`
- `access-control-redesign.md`

## Maintenance focus

- Preserve traceability from spec to task to review.
- Avoid large unreviewable tasks.
- Keep agent responsibilities explicit.
- Prefer boring, predictable processes over magic automation.
- Do not treat AI output as automatically correct.
- Explain uncertainty and validation gaps honestly.
