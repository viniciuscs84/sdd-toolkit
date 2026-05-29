# SDD Toolkit Agent Entry Point

Read `/README.md` first.

This toolkit provides a reusable Specification-Driven Development workflow for AI-assisted software engineering.

For reusable agent definitions, read:

- `agents/agent-catalog.md`
- `agents/product-owner.md`
- `agents/tech-lead.md`

For OpenCode-specific context, read:

- `.opencode/context/project.md`
- `.opencode/context/workflow.md`

Rules:

- Keep changes small and reviewable.
- Start from specs before implementation.
- Separate product clarification, technical planning, execution and review.
- Use specialist agents from `agents/` for focused work.
- Do not hide risk behind automation.
- Validate with the commands appropriate for the target project when possible.
- If validation cannot be run, explain why.
