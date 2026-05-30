# Platform Setup Scripts

This folder contains one setup script per supported AI/developer platform.

Each script copies the SDD Toolkit files into the structure expected by the selected platform. The user chooses which script to run.

## Supported platforms

- Claude
- OpenCode
- GitHub Copilot
- Codex

## Linux, macOS, Git Bash or WSL

From the root of this repository:

```bash
bash scripts/setup-claude.sh /path/to/target-project
bash scripts/setup-opencode.sh /path/to/target-project
bash scripts/setup-github-copilot.sh /path/to/target-project
bash scripts/setup-codex.sh /path/to/target-project
```

## Windows PowerShell

From the root of this repository:

```powershell
.\scripts\setup-claude.ps1 C:\Path\To\TargetProject
.\scripts\setup-opencode.ps1 C:\Path\To\TargetProject
.\scripts\setup-github-copilot.ps1 C:\Path\To\TargetProject
.\scripts\setup-codex.ps1 C:\Path\To\TargetProject
```

If PowerShell blocks script execution, run one of these from a trusted terminal:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

or call a script with:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup-claude.ps1 C:\Path\To\TargetProject
```

## If no target path is provided

Scripts use the current working directory.

```bash
bash scripts/setup-claude.sh
```

```powershell
.\scripts\setup-claude.ps1
```

## Source folders copied

The scripts read from:

```text
agents/
agent-blueprints/
skills/
context/
docs/templates/
```

## Generated locations

```text
Claude           -> .claude/ + CLAUDE.md
OpenCode         -> .opencode/ + AGENTS.md + opencode.json
GitHub Copilot   -> .github/sdd-toolkit/ + .github/copilot-instructions.md
Codex            -> .codex/sdd-toolkit/ + CODEX.md
```

## Safety

Scripts do not copy secrets.

Scripts replace the generated toolkit folder for the selected platform, for example `.claude/` or `.github/sdd-toolkit/`. Review generated files before committing them to your own project.

Do not run a platform setup script in a project that already has important custom files in the target generated folder unless you have backed them up.
