# SDD Toolkit

A reusable toolkit of agents, blueprints, skills, templates, context files and setup scripts for **Specification-Driven Development (SDD)** in AI-assisted software engineering.

The goal of this project is to help humans and AI agents work together without jumping straight from an idea to code. The toolkit defines a structured workflow where requirements are clarified, specs are written, waves and tasks are planned, execution is coordinated and quality gates are checked.

## Why this exists

AI coding tools are powerful, but they become risky when they are used without clear scope, context and validation.

This toolkit helps prevent common problems:

- coding before the requirement is clear
- planning work outside the approved spec
- silently inventing technical details
- losing traceability between requirement, spec, wave, task and implementation
- skipping tests, review, acceptance or security checks
- mixing product decisions with implementation details
- treating AI output as automatically correct

## Core idea

The human remains the final authority.

Agents help ask questions, document context, write specs, plan execution, recruit stack-specific agents, build skills, coordinate tasks and validate quality.

The main workflow is:

```text
idea / issue / request
-> Product Owner clarifies with the human
-> requirement is approved
-> Spec Writer writes the specification
-> Tech Lead plans waves and tasks
-> Agent Recruiter creates project-specific agents when needed
-> Skill Builder creates or recommends required skills
-> Orchestrator coordinates execution
-> quality gate agents validate review, tests, acceptance and security
-> Context Maintainer and Docs Maintainer update records
```

## Repository structure

```text
agents/               active agent definitions
agent-blueprints/     templates for creating project-specific agents
skills/               reusable skills for SDD tasks
context/              workflow and reusable context files
docs/templates/       templates for specs, waves and tasks
scripts/              setup scripts for supported platforms
SECURITY.md           security and responsible-use guidance
```

## Human-facing agents

Three agents are designed to interact directly with humans.

### Product Owner

`agents/product-owner.md`

Responsible for project setup, product clarification and requirement approval flow.

The Product Owner:

- asks the human the questions needed to configure the project
- identifies missing definitions
- clarifies product goals, users, scope and acceptance direction
- calls subagents to record approved setup work
- notifies the human when the project is ready for execution planning
- never infers missing technical details

### Tech Lead

`agents/tech-lead.md`

Responsible for technical planning.

The Tech Lead:

- plans approved specs into waves and tasks
- validates task dependencies
- ensures planning stays inside the approved spec
- starts planning only after stack, agents and skills are defined
- keeps task-management systems consistent when integration exists
- calls the Orchestrator to execute planned tasks

### Orchestrator

`agents/orchestrator.md`

Responsible for execution coordination.

The Orchestrator:

- receives planned tasks from the Tech Lead
- may receive explicit human-approved ad hoc tasks
- identifies capable agents
- calls active or recruited agents
- coordinates execution order
- enforces document consistency
- enforces quality gates
- does not implement code directly

## Subagents

Subagents are focused roles called by the human-facing agents or by other specialists.

Current subagents include:

- `context-maintainer.md`: maintains agent-facing project context
- `spec-writer.md`: writes formal SDD specifications
- `agent-recruiter.md`: creates/configures project-specific agents from blueprints
- `skill-builder.md`: creates, adapts or recommends skills
- `architecture-specialist.md`: reviews boundaries, dependencies and maintainability
- `ux-specialist.md`: reviews user flows and interface behavior
- `review-specialist.md`: performs technical review
- `testing-specialist.md`: defines and validates testing strategy
- `acceptance-specialist.md`: validates acceptance criteria and product readiness
- `cybersecurity-specialist.md`: reviews security impact and residual risk
- `docs-maintainer.md`: maintains human-facing documentation

## Agent blueprints

Blueprints are not active agents by default. They are templates used by Agent Recruiter to create project-specific agents for a stack or tool.

Available blueprints:

- `stack-specialist.md`
- `frontend-specialist.md`
- `backend-specialist.md`
- `api-specialist.md`
- `data-specialist.md`
- `devops-specialist.md`
- `repository-specialist.md`
- `project-management-specialist.md`

Example:

```text
Project stack:
- ASP.NET Core
- React
- PostgreSQL
- Docker
- GitHub
- Azure Boards

Agent Recruiter may create:
- dotnet-api-specialist
- react-frontend-specialist
- postgres-data-specialist
- docker-devops-specialist
- github-repository-specialist
- azure-boards-project-management-specialist
```

## Skills

Skills are reusable instructions or procedures that agents can use for recurring work.

The Skill Builder is responsible for creating, adapting or recommending skills required by recruited agents.

It may use:

- official documentation
- public web research
- existing local skills
- optionally, the skills.sh API when the user provides their own token

The Skill Builder must not store, print, commit or expose user tokens.

## Context folder

The `context/` folder stores agent-facing operational context.

```text
context/workflow.md           human x agents workflow
context/product.md            product vision, goals, users and value proposition
context/business-rules.md     approved business rules
context/architecture.md       architecture decisions and boundaries
context/stack.md              technologies, tools and commands
context/decisions.md          decision log
context/glossary.md           domain terms
context/constraints.md        product, technical, legal, operational and security constraints
context/current-state.md      current known project state
```

Product Owner owns product-context decisions.

Context Maintainer keeps the context folder accurate, concise and consistent.

## Templates

Templates live under `docs/templates/`.

They are used to preserve traceability:

```text
docs/templates/spec-template.md
docs/templates/wave-template.md
docs/templates/task-template.md
```

### Spec template

Used by Spec Writer to formalize approved requirements.

### Wave template

Used by Tech Lead to group related implementation work and define planning preconditions.

### Task template

Used by Tech Lead and Orchestrator to keep execution traceable, validated and gated.

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

A task should not be considered complete while any gate is missing or failed.

## Platform setup scripts

The toolkit can be installed into different AI/developer platforms.

The user chooses one script according to the platform they want to use.

### Linux, macOS, Git Bash or WSL

```bash
bash scripts/setup-claude.sh /path/to/your-project
bash scripts/setup-opencode.sh /path/to/your-project
bash scripts/setup-github-copilot.sh /path/to/your-project
bash scripts/setup-codex.sh /path/to/your-project
```

### Windows PowerShell

```powershell
.\scripts\setup-claude.ps1 C:\Path\To\YourProject
.\scripts\setup-opencode.ps1 C:\Path\To\YourProject
.\scripts\setup-github-copilot.ps1 C:\Path\To\YourProject
.\scripts\setup-codex.ps1 C:\Path\To\YourProject
```

If PowerShell blocks script execution, run from a trusted terminal:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

or run a script with:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup-claude.ps1 C:\Path\To\YourProject
```

## What each setup script creates

```text
Claude           -> .claude/ + CLAUDE.md
OpenCode         -> .opencode/ + AGENTS.md + opencode.json
GitHub Copilot   -> .github/sdd-toolkit/ + .github/copilot-instructions.md
Codex            -> .codex/sdd-toolkit/ + CODEX.md
```

Each script copies:

```text
agents/
agent-blueprints/
skills/
context/
docs/templates/
```

## Manual reuse

You can also copy only the folders you need:

```bash
cp -r agents /path/to/your-project/
cp -r agent-blueprints /path/to/your-project/
cp -r skills /path/to/your-project/
cp -r context /path/to/your-project/
cp -r docs/templates /path/to/your-project/docs/
```

Then customize:

1. `agents/agent-catalog.md`
2. `context/workflow.md`
3. `context/stack.md`
4. `context/current-state.md`
5. `skills/`
6. recruited agents created from `agent-blueprints/`

## Recommended adoption flow

1. Run the setup script for your platform.
2. Start with the Product Owner.
3. Let Product Owner ask the project setup questions.
4. Fill or approve the required context files.
5. Let Product Owner call Spec Writer after a requirement is approved.
6. Let Tech Lead plan approved specs into waves and tasks.
7. Let Agent Recruiter create project-specific agents when the stack requires it.
8. Let Skill Builder create or recommend skills for those agents.
9. Let Orchestrator coordinate execution.
10. Review quality gates before accepting the work.

## Design principles

- Start from specifications before code.
- Product Owner, Tech Lead and Orchestrator are available to humans.
- Do not infer missing technical details.
- Do not plan work outside the approved specification.
- Define stack, agents and skills before implementation planning.
- Keep waves and tasks traceable to specs.
- Keep task dependencies consistent and explicit.
- Use explicit task categories and quality gates.
- Treat security as a default review concern.
- Always report what was validated and what was not.

## Safety and responsibility

Do not publish secrets, tokens, client names, private URLs or proprietary project rules when adapting this toolkit.

Do not install third-party skills or generated agents into a production project without human review.

Do not use ad hoc Orchestrator tasks to bypass the Product Owner or Tech Lead.

See `SECURITY.md` before sharing a customized version.

## License

MIT, unless otherwise changed by the repository owner.
