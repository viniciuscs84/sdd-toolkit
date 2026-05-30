#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

REPO_ROOT="$(resolve_repo_root)"
TARGET_DIR="$(resolve_target_dir "${1:-.}")"
PLATFORM_DIR="$TARGET_DIR/.opencode"

validate_common_sources "$REPO_ROOT"

mkdir -p "$PLATFORM_DIR"
copy_dir_clean "$REPO_ROOT/agents" "$PLATFORM_DIR/agents"
copy_dir_clean "$REPO_ROOT/agent-blueprints" "$PLATFORM_DIR/agent-blueprints"
copy_dir_clean "$REPO_ROOT/skills" "$PLATFORM_DIR/skills"
copy_dir_clean "$REPO_ROOT/context" "$PLATFORM_DIR/context"
copy_dir_clean "$REPO_ROOT/docs/templates" "$PLATFORM_DIR/templates"
copy_dir_clean "$REPO_ROOT/config" "$PLATFORM_DIR/config"

write_file "$TARGET_DIR/AGENTS.md" "# OpenCode SDD Toolkit Instructions

Use the SDD Toolkit files under \`.opencode/\`.

Human-facing agents:

- \`.opencode/agents/product-owner.md\`
- \`.opencode/agents/tech-lead.md\`
- \`.opencode/agents/orchestrator.md\`

Workflow:

- Read \`.opencode/context/workflow.md\` before coordinating SDD work.
- Use \`.opencode/templates/\` for specs, waves and tasks.
- Use \`.opencode/agent-blueprints/\` only when project-specific agents must be recruited.
- Adapt \`.opencode/config/model-routing.example.yml\` to the models available in this project.
"

write_file "$TARGET_DIR/opencode.json" "{
  \"$schema\": \"https://opencode.ai/config.json\",
  \"instructions\": [
    \"AGENTS.md\",
    \".opencode/context/workflow.md\",
    \".opencode/agents/agent-catalog.md\"
  ]
}
"

print_done "OpenCode" "$TARGET_DIR"
