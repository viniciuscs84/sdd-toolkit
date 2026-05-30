# SDD Toolkit

A reusable toolkit of agents, blueprints, skills, templates, context files and setup scripts for **Specification-Driven Development (SDD)** in AI-assisted software engineering.

The goal of this project is to help humans and AI agents work together without jumping straight from an idea to code. The toolkit defines a structured workflow where requirements are clarified, environments are configured, specs are written, waves and tasks are planned, execution is coordinated and quality gates are checked.

Portuguese version: [`README.pt-BR.md`](README.pt-BR.md)

## Quick start

Choose the setup script for the AI/developer platform you want to use.

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

If no target path is provided, scripts use the current working directory.

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
config/
```

After setup, review `config/model-routing.example.yml` and adapt it to the models available in your platform or subscription.

## Recommended adoption flow

1. Run the setup script for your platform.
2. Start with the Product Owner.
3. Let Product Owner ask the project setup questions.
4. Let Product Owner call Env Configr for environment, AI platform, model routing and communication setup.
5. Fill or approve the required context files.
6. Configure model routing if your platform supports per-agent model selection.
7. Let Product Owner call Spec Writer after a requirement is approved.
8. Let Tech Lead plan approved specs into waves and tasks.
9. Let Agent Recruiter create project-specific agents when the stack requires it.
10. Let Skill Builder create or recommend skills for those agents.
11. Let Orchestrator coordinate execution.
12. Review quality gates before accepting the work.

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
- using expensive models for simple work without an intentional routing policy
- forcing one language or communication style across human and agent interactions

## Core idea

The human remains the final authority.

Agents help ask questions, configure the environment, document context, write specs, plan execution, recruit stack-specific agents, build skills, coordinate tasks and validate quality.

The main workflow is:

```text
idea / issue / request
-> Product Owner clarifies with the human
-> Env Configr configures environment, AI platform, model routing and communication rules
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
config/               optional project/platform configuration, including model routing
scripts/              setup scripts for supported platforms
SECURITY.md           security and responsible-use guidance
```

## Model routing

Agents may use different models depending on task complexity, risk and cost.

The toolkit does not hardcode model names because model availability depends on each user's platform, provider, subscription, cost limits and compliance requirements.

Use this file as a starting point:

```text
config/model-routing.example.yml
```

It defines logical model profiles such as:

- `economical`: simple, low-risk and repetitive tasks
- `fast`: routing and simple classification
- `standard`: balanced day-to-day work
- `reasoning`: planning, architecture and complex reasoning
- `high_assurance`: security, acceptance, final review and high-risk decisions

The file also includes suggested agent-to-profile assignments, communication rules and escalation rules.

Copy or adapt it inside the target project and replace placeholder model names with models available in the client's subscription.

Agents should ask the human instead of guessing when:

- model names are unknown
- the selected model is unavailable
- the task is cost-sensitive
- risk suggests escalation but no high-assurance model is configured

## Communication rules

- Inter-agent communication defaults to English.
- Specialized agents communicating with models should use the `caveman` skill by default to reduce token usage while preserving technical accuracy.
- Human interaction must adapt to the human's language.
- Human-facing artifacts must follow the language expected by the human or project context.
- Do not force English for human-facing artifacts unless the project explicitly requires it.
- Do not use caveman compression with humans unless the human explicitly asks for it.

## Human-facing agents

Four agents are designed to interact directly with humans.

### Product Owner

`agents/product-owner.md`

Responsible for project setup, product clarification and requirement approval flow.

The Product Owner:

- asks the human the questions needed to configure the project
- identifies missing definitions
- clarifies product goals, users, scope and acceptance direction
- calls Env Configr when environment or AI platform configuration is needed
- calls subagents to record approved setup work
- notifies the human when the project is ready for execution planning
- never infers missing technical details

### Env Configr

`agents/env-configr.md`

Responsible for development environment and AI-agent environment configuration.

Env Configr:

- configures the AI platform and development environment with the human
- helps choose the right setup script or platform layout
- configures model routing and communication rules
- passes environment/platform instructions to Agent Recruiter and Skill Builder
- ensures inter-agent communication uses English by default
- ensures specialized agent/model communication uses the `caveman` skill by default
- ensures human interaction and artifacts follow the human's language
- never guesses model names, subscription features, platform capabilities or credentials

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

The `caveman` skill is used by default for inter-agent and specialized model communication when token-efficient communication is useful.

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

## Manual reuse

You can also copy only the folders you need:

```bash
cp -r agents /path/to/your-project/
cp -r agent-blueprints /path/to/your-project/
cp -r skills /path/to/your-project/
cp -r context /path/to/your-project/
cp -r docs/templates /path/to/your-project/docs/
cp -r config /path/to/your-project/
```

Then customize:

1. `agents/agent-catalog.md`
2. `context/workflow.md`
3. `context/stack.md`
4. `context/current-state.md`
5. `config/model-routing.example.yml`
6. `skills/`
7. recruited agents created from `agent-blueprints/`

## Design principles

- Start from specifications before code.
- Product Owner, Env Configr, Tech Lead and Orchestrator are available to humans.
- Do not infer missing technical details.
- Do not guess model names, subscription features or platform capabilities.
- Do not plan work outside the approved specification.
- Define environment, platform, stack, agents and skills before implementation planning.
- Route agents to models intentionally according to complexity, risk and cost.
- Use English for inter-agent communication by default.
- Adapt human interaction and human-facing artifacts to the human's language.
- Use `caveman` for compact inter-agent/specialized-model communication by default.
- Keep waves and tasks traceable to specs.
- Keep task dependencies consistent and explicit.
- Use explicit task categories and quality gates.
- Treat security as a default review concern.
- Always report what was validated and what was not.

## Safety and responsibility

Do not publish secrets, tokens, client names, private URLs or proprietary project rules when adapting this toolkit.

Do not install third-party skills or generated agents into a production project without human review.

Do not use ad hoc Orchestrator tasks to bypass the Product Owner or Tech Lead.

Do not commit provider tokens or private model credentials in model routing files.

See `SECURITY.md` before sharing a customized version.

## Author

Created and maintained by **Vinícius Santos**.

- GitHub: https://github.com/viniciuscs84
- LinkedIn: https://www.linkedin.com/in/viniciuscs/

## License

MIT, unless otherwise changed by the repository owner.
