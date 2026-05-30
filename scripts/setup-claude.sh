#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

REPO_ROOT="$(resolve_repo_root)"
TARGET_DIR="$(resolve_target_dir "${1:-.}")"
PLATFORM_DIR="$TARGET_DIR/.claude"

validate_common_sources "$REPO_ROOT"

mkdir -p "$PLATFORM_DIR"
copy_dir_clean "$REPO_ROOT/agents" "$PLATFORM_DIR/agents"
copy_dir_clean "$REPO_ROOT/agent-blueprints" "$PLATFORM_DIR/agent-blueprints"
copy_dir_clean "$REPO_ROOT/skills" "$PLATFORM_DIR/skills"
copy_dir_clean "$REPO_ROOT/context" "$PLATFORM_DIR/context"
copy_dir_clean "$REPO_ROOT/docs/templates" "$PLATFORM_DIR/templates"

write_file "$TARGET_DIR/CLAUDE.md" "# Claude SDD Toolkit Instructions

Use the SDD Toolkit files under \`.claude/\`.

Human-facing agents:

- \`.claude/agents/product-owner.md\`
- \`.claude/agents/tech-lead.md\`
- \`.claude/agents/orchestrator.md\`

Workflow:

- Read \`.claude/context/workflow.md\` before coordinating SDD work.
- Use \`.claude/templates/\` for specs, waves and tasks.
- Use \`.claude/agent-blueprints/\` only when project-specific agents must be recruited.
"

print_done "Claude" "$TARGET_DIR"
