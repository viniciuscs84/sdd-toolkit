# SDD Specialist Agents Catalog

This directory defines active agents for Specification-Driven Development.

Use active agents to plan, coordinate, validate and maintain SDD work. Use `agent-blueprints/` when a project needs stack-specific implementation agents.

## Core SDD agents

- `product-owner.md`: clarifies product goals, user value, scope, priorities and acceptance criteria with the human stakeholder before technical planning starts.
- `spec-writer.md`: writes formal SDD specifications from requirements approved by the Product Owner and the human stakeholder.
- `tech-lead.md`: turns approved specs into waves and executable tasks, estimates size, maps required specialists and sends ready work to the Orchestrator. It does not change code directly.
- `agent-recruiter.md`: recruits and configures project-specific implementation agents from `agent-blueprints/`.
- `skill-builder.md`: creates, adapts or recommends skills required by recruited agents, using official documentation, web research and optionally skills.sh with a user-provided token.
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
- `ux-specialist.md`: reviews user flows, screen behavior, interaction states, copy clarity, accessibility concerns and developer experience.

## Agent blueprints

Blueprints are not the default active implementation team. They are templates used by `agent-recruiter.md` to create stack-specific implementation agents for a project.

Available blueprints:

- `agent-blueprints/stack-specialist.md`: base template for a concrete technology stack or framework specialist.
- `agent-blueprints/frontend-specialist.md`: template for a project-specific frontend implementation agent.
- `agent-blueprints/backend-specialist.md`: template for a project-specific backend implementation agent.
- `agent-blueprints/api-specialist.md`: template for a project-specific API implementation agent.
- `agent-blueprints/data-specialist.md`: template for a project-specific data implementation agent.
- `agent-blueprints/devops-specialist.md`: template for a project-specific DevOps implementation agent.

## Recommended flow

1. Product Owner debates and approves the requirement with the human stakeholder.
2. Product Owner calls Spec Writer.
3. Spec Writer writes the SDD specification.
4. Tech Lead turns the spec into waves and executable tasks.
5. Tech Lead calls Agent Recruiter when implementation requires stack-specific agents.
6. Agent Recruiter asks Skill Builder which skills recruited agents need.
7. Skill Builder researches, recommends or drafts required skills.
8. Agent Recruiter creates or configures implementation agents from blueprints and assigns required skills.
9. Orchestrator coordinates execution using active agents and recruited agents.
10. Quality gate agents validate `review`, `tests`, `acceptance` and `security`.
11. Docs Maintainer updates documentation before wave closure.

## Mandatory rules

- Product Owner approves requirements with the human before calling Spec Writer.
- Spec Writer writes specs; it does not approve requirements or plan implementation tasks.
- Planning agents do not edit code.
- Agent Recruiter creates or configures agents; it does not implement project features.
- Skill Builder creates, adapts or recommends skills; it does not implement project features or recruit agents.
- Skill Builder may use skills.sh only when the user provides their own authentication token for the current task.
- The Orchestrator does not implement code directly.
- Every task must report `review`, `tests`, `acceptance` and `security` gates.
- Lightweight task categories may simplify checklists, but do not remove gates.
- Tasks with potential security impact must call `cybersecurity-specialist.md` at the beginning and end.
- Tasks with documentation changes must call `testing-specialist.md` and `review-specialist.md` at the end.
- Parallel execution is allowed only when tasks have no dependency, no shared critical files and no meaningful impact overlap.

## Review principle

Every specialist should leave work easier for a human to review: clear scope, small diff, explicit validation and honest notes about uncertainty or known failures.
