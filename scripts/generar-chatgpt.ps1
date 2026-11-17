# Genera dist/taller-chatgpt.md desde docs/taller-chatgpt.fuente.md. Sin red.
# Uso: powershell -File scripts\generar-chatgpt.ps1
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$version = (Get-Content -Raw -Encoding UTF8 (Join-Path $root ".claude-plugin/plugin.json") | ConvertFrom-Json).version
$text = (Get-Content -Raw -Encoding UTF8 (Join-Path $root "docs/taller-chatgpt.fuente.md")).Replace("{{VERSION}}", $version).Replace("`r`n", "`n")
if ($text.Length -gt 7500) { throw "ERROR: $($text.Length) caracteres (max. 7500)" }
$dist = Join-Path $root "dist"
New-Item -ItemType Directory -Force -Path $dist | Out-Null
[System.IO.File]::WriteAllText((Join-Path $dist "taller-chatgpt.md"), $text, (New-Object System.Text.UTF8Encoding($false)))
Write-Output "OK  dist/taller-chatgpt.md - $($text.Length) caracteres - v$version"
