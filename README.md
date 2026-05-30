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

After setup, review the files under `config/` and adapt them to the platform, models, MCPs and project stage.

## Recommended adoption flow

1. Run the setup script for your platform.
2. Start with the Product Owner.
3. Let Product Owner ask the project setup questions.
4. Let Product Owner call Env Configr for environment, AI platform, MCP, readiness, model routing and communication setup.
5. Fill or approve the required context files.
6. Configure model routing if your platform supports per-agent model selection.
7. Configure MCPs only when they are known or required by a current task.
8. Let Product Owner call Spec Writer after a requirement is approved.
9. Let Tech Lead plan approved specs into waves and tasks.
10. Let Agent Recruiter create project-specific agents when the stack requires it.
11. Let Skill Builder create or recommend skills for those agents.
12. Let Orchestrator coordinate execution.
13. Review quality gates before accepting the work.

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
- blocking early project setup with deployment, database or MCP details that are not needed yet

## Core idea

The human remains the final authority.

Agents help ask questions, configure the environment, document context, write specs, plan execution, recruit stack-specific agents, build skills, coordinate tasks and validate quality.

The main workflow is:

```text
idea / issue / request
-> Product Owner clarifies with the human
-> Env Configr configures environment, AI platform, MCPs, readiness, model routing and communication rules
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
config/               optional project/platform configuration, including model routing, MCP and readiness rules
scripts/              setup scripts for supported platforms
SECURITY.md           security and responsible-use guidance
```

## Configuration

Configuration examples live under `config/`.

```text
config/model-routing.example.yml
config/mcp-config.example.yml
config/readiness-matrix.example.yml
```

### Model routing

Agents may use different models depending on task complexity, risk and cost.

The toolkit does not hardcode model names because model availability depends on each user's platform, provider, subscription, cost limits and compliance requirements.

`config/model-routing.example.yml` defines logical profiles such as:

- `economical`: simple, low-risk and repetitive tasks
- `fast`: routing and simple classification
- `standard`: balanced day-to-day work
- `reasoning`: planning, architecture and complex reasoning
- `high_assurance`: security, acceptance, final review and high-risk decisions

Agents should ask the human instead of guessing when model names are unknown, unavailable, cost-sensitive or insufficient for risk.

### MCP configuration

`config/mcp-config.example.yml` defines how MCP servers should be configured and when they are required.

MCPs are not automatically mandatory at project start. They become mandatory only when a stage or task needs them.

Examples:

- repository MCP: required only when repository operations depend on MCP access
- project-management MCP: required only when issues, work items, boards or milestones must be synchronized through MCP
- database MCP: required only when a task needs live database inspection or real database validation
- deployment MCP: required only when deployment, release or environment inspection is requested

Never store MCP secrets, tokens, database URLs or deployment credentials in repository files. Use the secure secret mechanism provided by the selected platform.

### Readiness matrix

`config/readiness-matrix.example.yml` defines when missing definitions block work.

Definitions are classified as:

- `mandatory_now`: required before the current stage can proceed
- `optional_now`: useful now, but not required to proceed
- `later_stage`: not required now; required only when a later stage or task needs it
- `not_applicable`: not required for this project or task

Examples:

- Deployment environment is not required during early project setup, but becomes mandatory when deploy is requested.
- Database credentials are not required during early project setup, but become mandatory when a task must connect to a real database.
- MCP servers are optional during early project setup, but become mandatory when a task requires external access through MCP.

When a missing definition blocks progress, the active agent must tell the human which definition is missing, why it is required now, which stage or task it blocks and which agent should resolve it.

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

The Product Owner asks setup questions, identifies missing definitions, calls Env Configr when environment/platform configuration is needed, calls subagents to record approved setup work and never infers missing technical details.

### Env Configr

`agents/env-configr.md`

Responsible for development environment and AI-agent environment configuration.

Env Configr configures AI platform, MCPs, readiness rules, model routing and communication rules. It passes environment/platform instructions to Agent Recruiter and Skill Builder, and it never guesses model names, subscription features, MCP capabilities, platform capabilities or credentials.

### Tech Lead

`agents/tech-lead.md`

Responsible for technical planning.

The Tech Lead plans approved specs into waves and tasks, validates dependencies, stays inside the approved spec, starts planning only after stack/agents/skills are defined and calls the Orchestrator to execute planned tasks.

### Orchestrator

`agents/orchestrator.md`

Responsible for execution coordination.

The Orchestrator receives planned tasks from the Tech Lead, may receive explicit human-approved ad hoc tasks, identifies capable agents, coordinates execution, enforces document consistency and enforces quality gates.

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

## Skills

Skills are reusable instructions or procedures that agents can use for recurring work.

The Skill Builder is responsible for creating, adapting or recommending skills required by recruited agents.

It may use official documentation, public web research, existing local skills and optionally the skills.sh API when the user provides their own token.

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

Product Owner owns product-context decisions. Context Maintainer keeps the context folder accurate, concise and consistent.

## Templates

Templates live under `docs/templates/`.

```text
docs/templates/spec-template.md
docs/templates/wave-template.md
docs/templates/task-template.md
```

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
6. `config/mcp-config.example.yml`
7. `config/readiness-matrix.example.yml`
8. `skills/`
9. recruited agents created from `agent-blueprints/`

## Design principles

- Start from specifications before code.
- Product Owner, Env Configr, Tech Lead and Orchestrator are available to humans.
- Do not infer missing technical details.
- Do not guess model names, subscription features, MCP capabilities or platform capabilities.
- Do not require deployment, database or MCP configuration before a stage actually needs it.
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

Do not commit provider tokens, MCP credentials, database URLs, deployment credentials or private model credentials in configuration files.

See `SECURITY.md` before sharing a customized version.

## Author

Created and maintained by **Vinícius Santos**.

- GitHub: https://github.com/viniciuscs84
- LinkedIn: https://www.linkedin.com/in/viniciuscs/

## License

MIT, unless otherwise changed by the repository owner.
