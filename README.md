# SDD Toolkit

A reusable toolkit of agents, skills, blueprints, templates and workflows for Specification-Driven Development (SDD) in AI-assisted software engineering.

This repository contains a project-neutral toolkit for turning ideas, requirements and issues into specifications, waves, tasks, coordinated execution, quality gates and documentation updates.

## What this is

This toolkit is not just a prompt collection. It is an opinionated workflow for moving from specification to implementation with traceability, small reviewable tasks and explicit quality gates.

The core flow is:

```text
idea / issue
-> product clarification
-> specification
-> wave planning
-> task planning
-> agent recruitment when needed
-> skill building when needed
-> coordinated execution
-> quality gates
-> human review
-> documentation/context updates
```

## What is included

```text
agents/               active agent definitions
agent-blueprints/     templates for project-specific agents
skills/               reusable skills for SDD tasks
context/              human x agents workflow and reusable context files
docs/templates/       templates for specs, waves and tasks
scripts/              setup scripts for supported platforms
```

Human-facing agents:

- Product Owner
- Tech Lead
- Orchestrator

Subagents include:

- Context Maintainer
- Spec Writer
- Agent Recruiter
- Skill Builder
- Architecture Specialist
- UX Specialist
- Cybersecurity Specialist
- Testing Specialist
- Acceptance Specialist
- Review Specialist
- Docs Maintainer

## Platform setup scripts

Choose the script for the platform you want to use:

```bash
bash scripts/setup-claude.sh /path/to/your-project
bash scripts/setup-opencode.sh /path/to/your-project
bash scripts/setup-github-copilot.sh /path/to/your-project
bash scripts/setup-codex.sh /path/to/your-project
```

If no target path is provided, scripts use the current working directory.

Each script copies the toolkit into the platform-specific structure and writes the instruction file expected by that platform.

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

## Quality gates

Every task should report these gates:

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

## Adapting to your stack

Use `agent-blueprints/` to create project-specific agents for your stack and tools, such as:

- frontend implementation
- backend implementation
- API implementation
- data/storage work
- DevOps and deployment
- repository operations
- project/task-management systems

The Agent Recruiter is responsible for creating or configuring those agents. The Skill Builder is responsible for creating, adapting or recommending the skills they need.

## Repository status

This is a public toolkit extracted and generalized from a real agent workflow. Project-specific names, paths and product rules were generalized so other people can reuse the workflow safely.

## Security notice

Do not publish secrets, tokens, client names, private URLs or proprietary project rules when adapting this toolkit. See `SECURITY.md` before sharing a customized version.

## License

MIT, unless otherwise changed by the repository owner.
