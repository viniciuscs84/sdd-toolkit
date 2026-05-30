param(
    [string]$TargetPath = '.'
)

. "$PSScriptRoot\lib\common.ps1"

$repoRoot = Get-RepoRoot
$targetDir = Get-TargetDir -TargetPath $TargetPath
$platformDir = Join-Path $targetDir '.codex/sdd-toolkit'

Test-CommonSources -RepoRoot $repoRoot

if (-not (Test-Path $platformDir)) {
    New-Item -ItemType Directory -Path $platformDir | Out-Null
}

Copy-DirClean -Source (Join-Path $repoRoot 'agents') -Target (Join-Path $platformDir 'agents')
Copy-DirClean -Source (Join-Path $repoRoot 'agent-blueprints') -Target (Join-Path $platformDir 'agent-blueprints')
Copy-DirClean -Source (Join-Path $repoRoot 'skills') -Target (Join-Path $platformDir 'skills')
Copy-DirClean -Source (Join-Path $repoRoot 'context') -Target (Join-Path $platformDir 'context')
Copy-DirClean -Source (Join-Path $repoRoot 'docs/templates') -Target (Join-Path $platformDir 'templates')
Copy-DirClean -Source (Join-Path $repoRoot 'config') -Target (Join-Path $platformDir 'config')

$instructions = @'
# Codex SDD Toolkit Instructions

Use the SDD Toolkit files under `.codex/sdd-toolkit/`.

Human-facing agents:

- `.codex/sdd-toolkit/agents/product-owner.md`
- `.codex/sdd-toolkit/agents/env-configr.md`
- `.codex/sdd-toolkit/agents/tech-lead.md`
- `.codex/sdd-toolkit/agents/orchestrator.md`

Workflow:

- Read `.codex/sdd-toolkit/context/workflow.md` before coordinating SDD work.
- Use `.codex/sdd-toolkit/templates/` for specs, waves and tasks.
- Use `.codex/sdd-toolkit/agent-blueprints/` only when project-specific agents must be recruited.
- Adapt `.codex/sdd-toolkit/config/model-routing.example.json` to the models available in this project.
- Adapt `.codex/sdd-toolkit/config/mcp-config.example.json` when MCPs are needed.
- Use `.codex/sdd-toolkit/config/readiness-matrix.example.json` to decide which definitions block the current stage.

Execution rules:

- Do not plan work outside an approved spec unless the human explicitly approves an ad hoc task.
- Preserve traceability among specs, waves and tasks.
- Report validation that was executed and validation that could not be executed.
'@

Write-TextFile -Target (Join-Path $targetDir 'CODEX.md') -Content $instructions
Write-Done -Platform 'Codex' -Target $targetDir
