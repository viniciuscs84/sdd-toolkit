Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-RepoRoot {
    $scriptPath = $PSCommandPath
    if (-not $scriptPath) {
        $scriptPath = $MyInvocation.MyCommand.Path
    }

    $scriptDir = Split-Path -Parent $scriptPath
    return (Resolve-Path (Join-Path $scriptDir '..\..')).Path
}

function Get-TargetDir {
    param(
        [string]$TargetPath = '.'
    )

    if (-not (Test-Path $TargetPath)) {
        New-Item -ItemType Directory -Path $TargetPath | Out-Null
    }

    return (Resolve-Path $TargetPath).Path
}

function Require-SourceDir {
    param(
        [string]$RepoRoot,
        [string]$RelativePath
    )

    $source = Join-Path $RepoRoot $RelativePath
    if (-not (Test-Path $source -PathType Container)) {
        throw "Missing required source folder: $RelativePath"
    }
}

function Copy-DirClean {
    param(
        [string]$Source,
        [string]$Target
    )

    if (Test-Path $Target) {
        Remove-Item -Recurse -Force $Target
    }

    $parent = Split-Path -Parent $Target
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    Copy-Item -Recurse -Force $Source $Target
}

function Write-TextFile {
    param(
        [string]$Target,
        [string]$Content
    )

    $parent = Split-Path -Parent $Target
    if ($parent -and -not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    Set-Content -Path $Target -Value $Content -Encoding UTF8
}

function Test-CommonSources {
    param(
        [string]$RepoRoot
    )

    Require-SourceDir -RepoRoot $RepoRoot -RelativePath 'agents'
    Require-SourceDir -RepoRoot $RepoRoot -RelativePath 'agent-blueprints'
    Require-SourceDir -RepoRoot $RepoRoot -RelativePath 'skills'
    Require-SourceDir -RepoRoot $RepoRoot -RelativePath 'context'
    Require-SourceDir -RepoRoot $RepoRoot -RelativePath 'docs/templates'
}

function Write-Done {
    param(
        [string]$Platform,
        [string]$Target
    )

    Write-Host "SDD Toolkit configured for $Platform at: $Target"
    Write-Host 'Review generated files before committing them.'
}
