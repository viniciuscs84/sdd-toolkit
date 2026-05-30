#!/usr/bin/env bash
set -euo pipefail

resolve_repo_root() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  cd "$script_dir/../.." && pwd
}

resolve_target_dir() {
  local target="${1:-.}"
  mkdir -p "$target"
  cd "$target" && pwd
}

require_source_dir() {
  local repo_root="$1"
  local relative_path="$2"

  if [ ! -d "$repo_root/$relative_path" ]; then
    echo "Missing required source folder: $relative_path" >&2
    exit 1
  fi
}

copy_dir_clean() {
  local source="$1"
  local target="$2"

  mkdir -p "$target"
  rm -rf "$target"
  mkdir -p "$(dirname "$target")"
  cp -R "$source" "$target"
}

write_file() {
  local target="$1"
  local content="$2"

  mkdir -p "$(dirname "$target")"
  printf '%s\n' "$content" > "$target"
}

validate_common_sources() {
  local repo_root="$1"

  require_source_dir "$repo_root" "agents"
  require_source_dir "$repo_root" "agent-blueprints"
  require_source_dir "$repo_root" "skills"
  require_source_dir "$repo_root" "context"
  require_source_dir "$repo_root" "docs/templates"
  require_source_dir "$repo_root" "config"
}

print_done() {
  local platform="$1"
  local target="$2"

  echo "SDD Toolkit configured for $platform at: $target"
  echo "Review generated files before committing them."
}
