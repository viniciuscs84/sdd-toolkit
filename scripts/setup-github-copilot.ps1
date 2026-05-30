param(
    [string]$TargetPath = '.'
)

. "$PSScriptRoot\lib\common.ps1"

$repoRoot = Get-RepoRoot
$targetDir = Get-TargetDir -TargetPath $TargetPath
$platformDir = Join-Path $targetDir '.github/sdd-toolkit'

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
# GitHub Copilot SDD Toolkit Instructions

Use the SDD Toolkit files under `.github/sdd-toolkit/`.

Human-facing agents:

- `.github/sdd-toolkit/agents/product-owner.md`
- `.github/sdd-toolkit/agents/tech-lead.md`
- `.github/sdd-toolkit/agents/orchestrator.md`

Workflow:

- Read `.github/sdd-toolkit/context/workflow.md` before coordinating SDD work.
- Use `.github/sdd-toolkit/templates/` for specs, waves and tasks.
- Use `.github/sdd-toolkit/agent-blueprints/` only when project-specific agents must be recruited.
- Adapt `.github/sdd-toolkit/config/model-routing.example.yml` to the models available in this project.

When generating or reviewing code, preserve traceability to specs, waves and tasks whenever applicable.
'@

Write-TextFile -Target (Join-Path $targetDir '.github/copilot-instructions.md') -Content $instructions
Write-Done -Platform 'GitHub Copilot' -Target $targetDir
