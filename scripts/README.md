# Platform Setup Scripts

This folder contains one setup script per supported AI/developer platform.

Each script copies the SDD Toolkit files into the structure expected by the selected platform. The user chooses which script to run.

## Available scripts

```text
scripts/setup-claude.sh
scripts/setup-opencode.sh
scripts/setup-github-copilot.sh
scripts/setup-codex.sh
```

## Usage

From the root of this repository:

```bash
bash scripts/setup-claude.sh /path/to/target-project
bash scripts/setup-opencode.sh /path/to/target-project
bash scripts/setup-github-copilot.sh /path/to/target-project
bash scripts/setup-codex.sh /path/to/target-project
```

If no target path is provided, scripts use the current working directory.

## Source folders copied

The scripts read from:

```text
agents/
agent-blueprints/
skills/
context/
docs/templates/
```

## Safety

Scripts do not copy secrets and do not overwrite tool-specific user files without creating the target folder first. Review generated files before committing them to your own project.
