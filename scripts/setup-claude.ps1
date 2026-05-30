param(
    [string]$TargetPath = '.'
)

. "$PSScriptRoot\lib\common.ps1"

$repoRoot = Get-RepoRoot
$targetDir = Get-TargetDir -TargetPath $TargetPath
$platformDir = Join-Path $targetDir '.claude'

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
# Claude SDD Toolkit Instructions

Use the SDD Toolkit files under `.claude/`.

Human-facing agents:

- `.claude/agents/product-owner.md`
- `.claude/agents/tech-lead.md`
- `.claude/agents/orchestrator.md`

Workflow:

- Read `.claude/context/workflow.md` before coordinating SDD work.
- Use `.claude/templates/` for specs, waves and tasks.
- Use `.claude/agent-blueprints/` only when project-specific agents must be recruited.
- Adapt `.claude/config/model-routing.example.yml` to the models available in this project.
'@

Write-TextFile -Target (Join-Path $targetDir 'CLAUDE.md') -Content $instructions
Write-Done -Platform 'Claude' -Target $targetDir
