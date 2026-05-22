# SDD Specialist Agents Catalog

This directory defines specialist agents for Specification-Driven Development.

Each agent is a focused role. Use them to make AI-assisted work easier to plan, execute and review.

## Core coordination agents

- `product-owner.md`: clarifies product goals, scope, acceptance criteria and user value.
- `tech-lead.md`: plans waves from specs, defines tasks, estimates size, maps required specialists and sends executable work to the Orchestrator. It does not change code directly.
- `orchestrator.md`: analyzes planned tasks, selects specialists, coordinates sequential or parallel execution, verifies gates and reports back to the Tech Lead. It does not change code directly.

## Routing agents

- `csharp-specialist.md`: routes C#/.NET tasks to the basic or advanced C# specialist.
- `database-specialist.md`: routes persistence/database tasks to the basic or advanced database specialist.

## Quality agents

- `code-review-specialist.md`: reviews diffs, risks, scope, maintainability, tests and merge readiness.
- `testing-specialist.md`: defines and implements automated testing strategy across unit, integration, regression, smoke and E2E tests.
- `qa-specialist.md`: validates acceptance criteria, exploratory scenarios, release risk and product quality.
- `cybersecurity-specialist.md`: performs security pre-check and final security review for tasks with security impact.

## Documentation agents

- `documentation-maintainer.md`: reviews and maintains documentation, specs, links and workflow consistency. It should be called at the end of each wave before closure.

## Specialist agents

- `architecture-specialist.md`: solution boundaries, project dependencies, framework design and long-term maintainability.
- `solution-maintainer.md`: solution files, project paths, project references and source/test organization.
- `csharp-basic-specialist.md`: simple C# changes, models, DTOs, enums, direct tests and small readability fixes.
- `csharp-advanced-specialist.md`: public APIs, advanced generics, reflection, performance, async complexity and deep refactoring.
- `database-basic-specialist.md`: simple mappings, small non-destructive migrations and simple queries.
- `database-advanced-specialist.md`: complex migrations, data transformation, performance, indexes, transactions and advanced SQL.
- `ux-specialist.md`: user flows, UI metadata, screens, interaction design and developer experience.

## Mandatory rules

- Planning agents do not edit code.
- Orchestrator does not edit code directly.
- Every task must report code-review, tests, QA and security gates.
- Lightweight task categories may simplify checklists, but do not remove gates.
- Tasks with potential security impact must call `cybersecurity-specialist.md` at the beginning and end.
- Tasks with documentation changes must call `testing-specialist.md` and `code-review-specialist.md` at the end.
- Parallel execution is allowed only when tasks have no dependency, no shared critical files and no meaningful impact overlap.

## Review principle

Every specialist should leave work easier for a human to review: clear scope, small diff, explicit validation and honest notes about uncertainty or known failures.
