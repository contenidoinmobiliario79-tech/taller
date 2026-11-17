# Mezcla a ciegas las salidas de dos perfiles / Blind-shuffle outputs of two profiles.
# Uso: .\mezclar.ps1 -CarpetaA runs\superpowers -CarpetaB runs\taller -Destino ciego
# Solo copia archivos locales; sin red.
param(
  [Parameter(Mandatory = $true)][string]$CarpetaA,
  [Parameter(Mandatory = $true)][string]$CarpetaB,
  [Parameter(Mandatory = $true)][string]$Destino
)

$ErrorActionPreference = 'Stop'

foreach ($dir in @($CarpetaA, $CarpetaB)) {
  if (-not (Test-Path -LiteralPath $dir -PathType Container)) { throw "No existe: $dir" }
}

$pares = Join-Path $Destino 'pares'
New-Item -ItemType Directory -Force -Path $pares | Out-Null
$clave = Join-Path $Destino 'clave.csv'
Set-Content -LiteralPath $clave -Value 'corrida,X,Y' -Encoding UTF8

Get-ChildItem -LiteralPath $CarpetaA -Directory | ForEach-Object {
  $run = $_.Name
  $otra = Join-Path $CarpetaB $run
  if (-not (Test-Path -LiteralPath $otra -PathType Container)) {
    Write-Warning "Falta $run en $CarpetaB, se omite"
    return
  }
  $destRun = Join-Path $pares $run
  New-Item -ItemType Directory -Force -Path $destRun | Out-Null
  if ((Get-Random -Minimum 0 -Maximum 2) -eq 0) {
    Copy-Item -Recurse -LiteralPath $_.FullName -Destination (Join-Path $destRun 'X')
    Copy-Item -Recurse -LiteralPath $otra -Destination (Join-Path $destRun 'Y')
    Add-Content -LiteralPath $clave -Value "$run,A,B" -Encoding UTF8
  } else {
    Copy-Item -Recurse -LiteralPath $otra -Destination (Join-Path $destRun 'X')
    Copy-Item -Recurse -LiteralPath $_.FullName -Destination (Join-Path $destRun 'Y')
    Add-Content -LiteralPath $clave -Value "$run,B,A" -Encoding UTF8
  }
}

Write-Output "Listo: pares en $pares. Guarda $clave sin mirarlo hasta terminar el juicio."
