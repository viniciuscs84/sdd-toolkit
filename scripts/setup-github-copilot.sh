#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

REPO_ROOT="$(resolve_repo_root)"
TARGET_DIR="$(resolve_target_dir "${1:-.}")"
PLATFORM_DIR="$TARGET_DIR/.github/sdd-toolkit"

validate_common_sources "$REPO_ROOT"

mkdir -p "$PLATFORM_DIR"
copy_dir_clean "$REPO_ROOT/agents" "$PLATFORM_DIR/agents"
copy_dir_clean "$REPO_ROOT/agent-blueprints" "$PLATFORM_DIR/agent-blueprints"
copy_dir_clean "$REPO_ROOT/skills" "$PLATFORM_DIR/skills"
copy_dir_clean "$REPO_ROOT/context" "$PLATFORM_DIR/context"
copy_dir_clean "$REPO_ROOT/docs/templates" "$PLATFORM_DIR/templates"
copy_dir_clean "$REPO_ROOT/config" "$PLATFORM_DIR/config"

write_file "$TARGET_DIR/.github/copilot-instructions.md" "# GitHub Copilot SDD Toolkit Instructions

Use the SDD Toolkit files under \`.github/sdd-toolkit/\`.

Human-facing agents:

- \`.github/sdd-toolkit/agents/product-owner.md\`
- \`.github/sdd-toolkit/agents/env-configr.md\`
- \`.github/sdd-toolkit/agents/tech-lead.md\`
- \`.github/sdd-toolkit/agents/orchestrator.md\`

Workflow:

- Read \`.github/sdd-toolkit/context/workflow.md\` before coordinating SDD work.
- Use \`.github/sdd-toolkit/templates/\` for specs, waves and tasks.
- Use \`.github/sdd-toolkit/agent-blueprints/\` only when project-specific agents must be recruited.
- Adapt \`.github/sdd-toolkit/config/model-routing.example.json\` to the models available in this project.
- Adapt \`.github/sdd-toolkit/config/mcp-config.example.json\` when MCPs are needed.
- Use \`.github/sdd-toolkit/config/readiness-matrix.example.json\` to decide which definitions block the current stage.

When generating or reviewing code, preserve traceability to specs, waves and tasks whenever applicable.
"

print_done "GitHub Copilot" "$TARGET_DIR"
