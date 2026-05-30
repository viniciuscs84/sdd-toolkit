# SDD Specialist Agents Catalog

This directory defines specialist agents for Specification-Driven Development.

Each agent is a focused role. Use them to make AI-assisted work easier to plan, execute and review.

## Core SDD agents

- `product-owner.md`: clarifies product goals, user value, scope, priorities and acceptance criteria before technical planning starts.
- `tech-lead.md`: turns approved specs into waves and executable tasks, estimates size, maps required specialists and sends ready work to the Orchestrator. It does not change code directly.
- `orchestrator.md`: coordinates execution of planned tasks, selects specialists, verifies gates and reports status back to the Tech Lead. It does not implement code directly.

## Quality gate agents

- `review-specialist.md`: reviews diffs, scope, maintainability, validation evidence and readiness for human review or merge.
- `testing-specialist.md`: defines and implements automated testing strategy across unit, integration, regression, smoke and end-to-end tests.
- `acceptance-specialist.md`: validates acceptance criteria, exploratory scenarios, release risk and product readiness.
- `cybersecurity-specialist.md`: performs security pre-checks and final security review for tasks with security impact.

## Documentation agents

- `docs-maintainer.md`: reviews and maintains documentation, specs, links, workflow notes and agent-facing guidance. It should be called at the end of each wave before closure.

## General technical agents

- `architecture-specialist.md`: reviews system boundaries, module responsibilities, dependencies, public contracts and long-term maintainability.
- `solution-maintainer.md`: maintains repository structure, solution files, project references, source/test organization and build structure.
- `ux-specialist.md`: reviews user flows, screen behavior, interaction states, copy clarity, accessibility concerns and developer experience.

## Technology-specific agents

- `csharp-basic-specialist.md`: handles simple C# changes, models, DTOs, enums, direct tests and small readability fixes.
- `csharp-senior-specialist.md`: handles public APIs, advanced generics, reflection, performance, async complexity and deep refactoring.
- `database-basic-specialist.md`: handles simple mappings, small non-destructive migrations and straightforward queries.
- `database-advanced-specialist.md`: handles complex migrations, data transformation, performance, indexes, transactions and advanced SQL.

## Optional routing agents

- `csharp-specialist.md`: routes C#/.NET tasks to the basic or senior C# specialist.
- `database-specialist.md`: routes persistence/database tasks to the basic or advanced database specialist.

Routing agents are useful when the Orchestrator needs a second pass on complexity before selecting the final executor. They are optional for small teams or simple workflows.

## Mandatory rules

- Planning agents do not edit code.
- The Orchestrator does not implement code directly.
- Every task must report `review`, `tests`, `acceptance` and `security` gates.
- Lightweight task categories may simplify checklists, but do not remove gates.
- Tasks with potential security impact must call `cybersecurity-specialist.md` at the beginning and end.
- Tasks with documentation changes must call `testing-specialist.md` and `review-specialist.md` at the end.
- Parallel execution is allowed only when tasks have no dependency, no shared critical files and no meaningful impact overlap.

## Review principle

Every specialist should leave work easier for a human to review: clear scope, small diff, explicit validation and honest notes about uncertainty or known failures.
