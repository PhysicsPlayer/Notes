# LaTeX compilation script (PowerShell version)

$ErrorActionPreference = "Stop"

$rootDir = if ($PSScriptRoot) {
    $PSScriptRoot
} else {
    (Get-Location).Path
}
$buildDir = Join-Path $rootDir "build"

if (-not (Get-Command latexmk -ErrorAction SilentlyContinue)) {
    throw "latexmk was not found in PATH."
}

$partFiles = @(Get-ChildItem -Path $buildDir -Filter "*.tex" -File | Sort-Object Name)
if ($partFiles.Count -eq 0) {
    throw "No part entry files were found in $buildDir."
}

Write-Host "Compiling $($partFiles.Count) part document(s)..." -ForegroundColor Cyan
Push-Location $buildDir
try {
    foreach ($partFile in $partFiles) {
        Write-Host "  build/$($partFile.Name)" -ForegroundColor Gray
        & latexmk -xelatex -interaction=nonstopmode -halt-on-error `
            "$($partFile.Name)"
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to compile $($partFile.Name)."
        }
    }
} finally {
    Pop-Location
}

Write-Host "Compiling main.tex..." -ForegroundColor Cyan
& latexmk -xelatex -interaction=nonstopmode -halt-on-error `
    (Join-Path $rootDir "main.tex")
if ($LASTEXITCODE -ne 0) {
    throw "Failed to compile main.tex."
}

Write-Host "Compilation completed." -ForegroundColor Green
