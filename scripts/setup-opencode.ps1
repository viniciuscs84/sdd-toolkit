param(
    [string]$TargetPath = '.'
)

. "$PSScriptRoot\lib\common.ps1"

$repoRoot = Get-RepoRoot
$targetDir = Get-TargetDir -TargetPath $TargetPath
$platformDir = Join-Path $targetDir '.opencode'

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

$agents = @'
# OpenCode SDD Toolkit Instructions

Use the SDD Toolkit files under `.opencode/`.

Human-facing agents:

- `.opencode/agents/product-owner.md`
- `.opencode/agents/tech-lead.md`
- `.opencode/agents/orchestrator.md`

Workflow:

- Read `.opencode/context/workflow.md` before coordinating SDD work.
- Use `.opencode/templates/` for specs, waves and tasks.
- Use `.opencode/agent-blueprints/` only when project-specific agents must be recruited.
- Adapt `.opencode/config/model-routing.example.yml` to the models available in this project.
'@

$config = @'
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": [
    "AGENTS.md",
    ".opencode/context/workflow.md",
    ".opencode/agents/agent-catalog.md"
  ]
}
'@

Write-TextFile -Target (Join-Path $targetDir 'AGENTS.md') -Content $agents
Write-TextFile -Target (Join-Path $targetDir 'opencode.json') -Content $config
Write-Done -Platform 'OpenCode' -Target $targetDir
