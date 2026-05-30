#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

REPO_ROOT="$(resolve_repo_root)"
TARGET_DIR="$(resolve_target_dir "${1:-.}")"
PLATFORM_DIR="$TARGET_DIR/.codex/sdd-toolkit"

validate_common_sources "$REPO_ROOT"

mkdir -p "$PLATFORM_DIR"
copy_dir_clean "$REPO_ROOT/agents" "$PLATFORM_DIR/agents"
copy_dir_clean "$REPO_ROOT/agent-blueprints" "$PLATFORM_DIR/agent-blueprints"
copy_dir_clean "$REPO_ROOT/skills" "$PLATFORM_DIR/skills"
copy_dir_clean "$REPO_ROOT/context" "$PLATFORM_DIR/context"
copy_dir_clean "$REPO_ROOT/docs/templates" "$PLATFORM_DIR/templates"

write_file "$TARGET_DIR/CODEX.md" "# Codex SDD Toolkit Instructions

Use the SDD Toolkit files under \`.codex/sdd-toolkit/\`.

Human-facing agents:

- \`.codex/sdd-toolkit/agents/product-owner.md\`
- \`.codex/sdd-toolkit/agents/tech-lead.md\`
- \`.codex/sdd-toolkit/agents/orchestrator.md\`

Workflow:

- Read \`.codex/sdd-toolkit/context/workflow.md\` before coordinating SDD work.
- Use \`.codex/sdd-toolkit/templates/\` for specs, waves and tasks.
- Use \`.codex/sdd-toolkit/agent-blueprints/\` only when project-specific agents must be recruited.

Execution rules:

- Do not plan work outside an approved spec unless the human explicitly approves an ad hoc task.
- Preserve traceability among specs, waves and tasks.
- Report validation that was executed and validation that could not be executed.
"

print_done "Codex" "$TARGET_DIR"
