# LaTeX Cleaning Script (PowerShell version)

# Resolve the directory containing this script (fallback to current directory if $PSScriptRoot is empty)
$rootDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Path $MyInvocation.MyCommand.Definition -Parent }
if (-not $rootDir) { $rootDir = Get-Location }

# Extensions to clean
$extensions = @("*.aux", "*.bcf", "*.log", "*.out", "*.run.xml", "*.toc", "*.synctex.gz", "*.fdb_latexmk", "*.fls", "*.blg", "*.bbl")

Write-Host "Cleaning LaTeX intermediate files..." -ForegroundColor Cyan

Get-ChildItem -Path $rootDir -Include $extensions -Recurse | ForEach-Object {
    Write-Host "Deleting: $($_.FullName)" -ForegroundColor Gray
    Remove-Item -Force $_.FullName
}

Write-Host "Done! Only .tex and .pdf files are kept." -ForegroundColor Green
