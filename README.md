# SDD Toolkit

A reusable toolkit of agents, skills, prompts and workflows for Specification-Driven Development (SDD) in AI-assisted software engineering.

This repository contains a public, project-neutral adaptation of my OpenCode setup: agents, workflow context, configuration and skills used to turn ideas, requirements and GitHub issues into specifications, implementation plans, coding tasks, reviews and tests.

## What this is

This toolkit is not just a prompt collection. It is an opinionated workflow for moving from specification to implementation with traceability, small reviewable tasks and explicit quality gates.

The core flow is:

```text
idea / issue
-> product clarification
-> specification
-> wave planning
-> task planning
-> implementation
-> quality gates
-> human review
-> wave PR
-> main
```

## What is included

```text
agents/               reusable agent definitions
skills/               reusable skills for SDD tasks
opencode/             OpenCode configuration and context
```

Included agent roles:

- Product Owner
- Tech Lead
- Orchestrator
- Architecture Specialist
- Solution Maintainer
- C# Specialist
- C# Basic Specialist
- C# Senior Specialist
- Database Specialist
- Database Basic Specialist
- Database Advanced Specialist
- UX Specialist
- Cybersecurity Specialist
- Testing Specialist
- Acceptance Specialist
- Review Specialist
- Docs Maintainer

## How to use

For general reuse, copy the root folders you need:

```bash
cp -r agents /path/to/your-project/
cp -r skills /path/to/your-project/
```

For OpenCode usage, also copy the OpenCode configuration:

```bash
cp -r opencode/* /path/to/your-project/
```

Then customize:

1. `agents/agent-catalog.md`
2. `skills/`
3. `opencode/AGENTS.md`
4. `opencode/.opencode/context/project.md`
5. `opencode/.opencode/context/workflow.md`
6. `opencode/opencode.json` permissions and allowed agent routing

## Design principles

- Start from specifications before code.
- Separate planning agents from implementation agents.
- Keep changes small and reviewable.
- Use explicit task categories and quality gates.
- Treat security as a default review concern.
- Do not hide risk behind automation.
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

This toolkit includes C#/.NET and database-focused agents because that is the original stack it came from. You can adapt it by replacing or adding specialists, for example:

- `frontend-specialist.md`
- `python-specialist.md`
- `devops-specialist.md`
- `mobile-specialist.md`
- `data-engineering-specialist.md`

When you add a new specialist, also update:

- `agents/agent-catalog.md`
- `opencode/opencode.json`
- `opencode/.opencode/context/workflow.md`

## Repository status

This is a public toolkit extracted and adapted from a private project setup. Project-specific names, paths and product rules were generalized so other people can reuse the workflow safely.

## Security notice

Do not publish secrets, tokens, client names, private URLs or proprietary project rules when adapting this toolkit. See `SECURITY.md` before sharing a customized version.

## License

MIT, unless otherwise changed by the repository owner.
