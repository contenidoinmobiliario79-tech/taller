# Taller: hook opcional de inicio de sesion para Windows PowerShell / PowerShell 7.
# Optional session-start hook. Inyecta un ruteo corto; no pega taller-inicio.
# Sin red, sin escribir archivos, sin telemetria.
# Uso / usage: powershell -NoProfile -ExecutionPolicy Bypass -File session-start.ps1 -Harness claude
param(
  [ValidateSet('claude', 'cursor', 'generic')]
  [string]$Harness = 'claude'
)

$ErrorActionPreference = 'Stop'

if ($env:TALLER_HOOK_OFF -eq '1') {
  Write-Output '{}'
  exit 0
}

$text = @"
Taller está instalado. No cargues taller-inicio de entrada.
- Cambio chico (un color, un typo, un texto): leé solo skills/verificar/SKILL.md.
- Cualquier otro pedido: leé skills/taller-inicio/SKILL.md y después solo las skills de la fila de AGENTS.md.
"@.Trim()

switch ($Harness) {
  'cursor'  { $payload = @{ additional_context = $text } }
  'generic' { $payload = @{ additionalContext = $text } }
  default   {
    $payload = @{
      hookSpecificOutput = @{
        hookEventName     = 'SessionStart'
        additionalContext = $text
      }
    }
  }
}

$json = $payload | ConvertTo-Json -Depth 5 -Compress
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Output $json
