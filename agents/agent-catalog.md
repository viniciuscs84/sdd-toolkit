# SDD Specialist Agents Catalog

This directory defines the agent roles used by the SDD Toolkit.

The human-facing agents are `product-owner.md`, `tech-lead.md` and `orchestrator.md`. Other agents are subagents called by the Product Owner, Tech Lead, Orchestrator or another specialist when their focused responsibility is needed.

Use `agent-blueprints/` when a project needs stack-specific implementation, repository or project-management agents.

## Human-facing agents

- `product-owner.md`: configures the project with the human, clarifies product goals, identifies definition gaps, asks required setup questions, owns product-context decisions and calls subagents to record approved setup work. It must not infer technical details.
- `tech-lead.md`: plans approved specs into coherent waves and executable tasks with consistent dependencies, required agents, skills and validation. It interacts with humans for technical planning and delegates execution to the Orchestrator.
- `orchestrator.md`: coordinates execution for planned tasks from the Tech Lead and explicit human-approved ad hoc tasks. It identifies capable agents, calls them, enforces document consistency and ensures quality gates are followed.

## Coordination subagents

- `context-maintainer.md`: keeps the `context/` folder accurate, concise and consistent using approved or clearly sourced product, business, architecture, stack, decision, glossary, constraint and current-state information.
- `spec-writer.md`: writes formal SDD specifications from requirements approved by the Product Owner and the human stakeholder.
- `agent-recruiter.md`: recruits and configures project-specific implementation agents from `agent-blueprints/`.
- `skill-builder.md`: creates, adapts or recommends skills required by recruited agents, using official documentation, web research and optionally skills.sh with a user-provided token.

## Quality gate subagents

- `review-specialist.md`: reviews diffs, scope, maintainability, validation evidence and readiness for human review or merge.
- `testing-specialist.md`: defines and implements automated testing strategy across unit, integration, regression, smoke and end-to-end tests.
- `acceptance-specialist.md`: validates acceptance criteria, exploratory scenarios, release risk and product readiness.
- `cybersecurity-specialist.md`: performs security pre-checks and final security review for tasks with security impact.

## Documentation subagents

- `docs-maintainer.md`: reviews and maintains human-facing documentation, specs, links, workflow notes and guides. It should be called at the end of each wave before closure.

## General technical subagents

- `architecture-specialist.md`: reviews system boundaries, module responsibilities, dependencies, public contracts and long-term maintainability.
- `ux-specialist.md`: reviews user flows, screen behavior, interaction states, copy clarity, accessibility concerns and developer experience.

## Agent blueprints

Blueprints are not the default active implementation team. They are templates used by `agent-recruiter.md` to create project-specific agents.

Available blueprints:

- `agent-blueprints/stack-specialist.md`: base template for a concrete technology stack or framework specialist.
- `agent-blueprints/frontend-specialist.md`: template for a project-specific frontend implementation agent.
- `agent-blueprints/backend-specialist.md`: template for a project-specific backend implementation agent.
- `agent-blueprints/api-specialist.md`: template for a project-specific API implementation agent.
- `agent-blueprints/data-specialist.md`: template for a project-specific data implementation agent.
- `agent-blueprints/devops-specialist.md`: template for a project-specific DevOps implementation agent.
- `agent-blueprints/repository-specialist.md`: template for a project-specific repository operations agent for GitHub, Azure Repos, SVN, VSS or another source control system.
- `agent-blueprints/project-management-specialist.md`: template for a project-specific task and project management operations agent for Azure Boards, GitHub Issues, Redmine, Jira or another project management system.

## Document templates

Use templates to keep specs, waves and tasks traceable:

- `templates/spec-template.md`: formal SDD specification template.
- `templates/wave-template.md`: wave planning template with spec traceability and planning preconditions.
- `templates/task-template.md`: executable task template with spec/wave traceability, agents, skills, validation and gates.

## Context folder

The `context/` folder stores agent-facing operational context:

- `context/workflow.md`
- `context/product.md`
- `context/business-rules.md`
- `context/architecture.md`
- `context/stack.md`
- `context/decisions.md`
- `context/glossary.md`
- `context/constraints.md`
- `context/current-state.md`

Product Owner owns product-context decisions. Context Maintainer keeps the context folder accurate, concise and consistent.

## Recommended flow

1. Product Owner asks the human the questions needed to configure the project.
2. Product Owner identifies definition gaps and calls subagents to record approved setup work.
3. Product Owner tells the human when the project is ready to start execution planning.
4. Product Owner debates and approves requirements with the human stakeholder.
5. Product Owner calls Context Maintainer when product or business context changes.
6. Product Owner calls Spec Writer.
7. Spec Writer writes the SDD specification using `templates/spec-template.md`.
8. Tech Lead verifies the approved spec, stack, required agents and required skills before planning.
9. Tech Lead plans specs into coherent waves and tasks using `templates/wave-template.md` and `templates/task-template.md`.
10. Tech Lead validates dependencies and keeps project/task-management systems consistent by calling the recruited specialist when integration exists.
11. Tech Lead calls Context Maintainer when planning creates or reveals durable technical context.
12. Tech Lead calls Agent Recruiter when implementation requires stack-specific, repository or project-management agents.
13. Agent Recruiter asks Skill Builder which skills recruited agents need.
14. Skill Builder researches, recommends or drafts required skills.
15. Agent Recruiter creates or configures agents from blueprints and assigns required skills.
16. Tech Lead calls Orchestrator with task details when planned execution is needed.
17. Orchestrator identifies capable agents, calls them and coordinates execution.
18. Orchestrator may also coordinate explicit human-approved ad hoc tasks when scope and risk are clear.
19. Quality gate subagents validate `review`, `tests`, `acceptance` and `security`.
20. Orchestrator ensures document consistency updates are handled by Context Maintainer, Docs Maintainer or project-management specialists.
21. Context Maintainer updates current state when relevant.
22. Docs Maintainer updates human-facing documentation before wave closure.

## Mandatory rules

- Product Owner, Tech Lead and Orchestrator are available to humans.
- All other active agents are subagents.
- Product Owner must ask for missing project definitions and must not infer technical details.
- Product Owner must notify the human when the project is ready for execution planning.
- Tech Lead must not plan work outside the approved spec.
- Tech Lead must not start planning until stack, required agents and required skills are defined or explicitly not needed.
- Tech Lead must keep task dependencies consistent and coherent.
- Tech Lead must use a project-management specialist when task-management integration exists and milestones/tasks need synchronization.
- Tech Lead must call Orchestrator to execute planned tasks.
- Orchestrator may receive human-approved ad hoc tasks, but must route product scope, architecture, security, data model or release-impacting work back to Product Owner or Tech Lead.
- Orchestrator must identify capable agents and call them; it does not implement code directly.
- Orchestrator must enforce document consistency and quality gates.
- Product Owner approves requirements with the human before calling Spec Writer.
- Product Owner owns product-context decisions.
- Context Maintainer maintains `context/`; it does not approve product decisions.
- Spec Writer writes specs; it does not approve requirements or plan implementation tasks.
- Planning agents do not edit code.
- Agent Recruiter creates or configures agents; it does not implement project features.
- Skill Builder creates, adapts or recommends skills; it does not implement project features or recruit agents.
- Skill Builder may use skills.sh only when the user provides their own authentication token for the current task.
- Every task must report `review`, `tests`, `acceptance` and `security` gates.
- Lightweight task categories may simplify checklists, but do not remove gates.
- Tasks with potential security impact must call `cybersecurity-specialist.md` at the beginning and end.
- Tasks with documentation changes must call `testing-specialist.md` and `review-specialist.md` at the end.
- Parallel execution is allowed only when tasks have no dependency, no shared critical files and no meaningful impact overlap.

## Review principle

Every specialist should leave work easier for a human to review: clear scope, small diff, explicit validation and honest notes about uncertainty or known failures.
