# Crea un ZIP por skill para subir a Claude.ai (Customize > Skills). Sin red.
# Creates one ZIP per skill for Claude.ai upload.
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$out = Join-Path $root 'dist\claude-ai'
New-Item -ItemType Directory -Force -Path $out | Out-Null

Get-ChildItem -LiteralPath (Join-Path $root 'skills') -Directory | ForEach-Object {
  if (Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md')) {
    $zip = Join-Path $out ($_.Name + '.zip')
    if (Test-Path -LiteralPath $zip) { Remove-Item -LiteralPath $zip }
    # Comprimir la carpeta (no su contenido) para que el ZIP quede como <skill>/SKILL.md
    Compress-Archive -LiteralPath $_.FullName -DestinationPath $zip
    Write-Output "OK  $zip"
  }
}
