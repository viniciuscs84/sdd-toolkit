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
opencode/
├── opencode.json
├── AGENTS.md
├── .opencode/
│   ├── agents/
│   └── context/
└── skills/
```

Included agent roles:

- Product Owner
- Tech Lead
- Orchestrator
- Architecture Specialist
- Solution Maintainer
- C# Specialist
- C# Basic Specialist
- C# Advanced Specialist
- Database Specialist
- Database Basic Specialist
- Database Advanced Specialist
- UX Specialist
- Cybersecurity Specialist
- Testing Specialist
- QA Specialist
- Code Review Specialist
- Documentation Maintainer

## How to use

Copy the contents of `opencode/` into the root of your own repository:

```bash
cp -r opencode/* /path/to/your-project/
cp -r opencode/.opencode /path/to/your-project/
```

Then customize:

1. `AGENTS.md`
2. `.opencode/context/project.md`
3. `.opencode/context/workflow.md`
4. agent descriptions under `.opencode/agents/`
5. `opencode.json` permissions and allowed agent routing

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

- `code-review`
- `tests`
- `qa`
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

- `.opencode/agents/agent-catalog.md`
- `opencode.json`
- `.opencode/context/workflow.md`

## Repository status

This is a public toolkit extracted and adapted from a private project setup. Project-specific names, paths and product rules were generalized so other people can reuse the workflow safely.

## Security notice

Do not publish secrets, tokens, client names, private URLs or proprietary project rules when adapting this toolkit. See `SECURITY.md` before sharing a customized version.

## License

MIT, unless otherwise changed by the repository owner.
