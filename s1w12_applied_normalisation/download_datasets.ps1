#!/usr/bin/env pwsh

$datasets = (Get-Content datasets.json | ConvertFrom-Json).datasets

foreach ( $dataset in $datasets ) {
    Write-Host "$($dataset.output)... " -NoNewLine
    if ( Test-Path -Path $dataset.output -PathType Leaf ) {
	Write-Host "exists" -ForegroundColor Green
	continue
    }
    Write-Host "downloading... " -NoNewLine -ForegroundColor Yellow
    Invoke-WebRequest -Uri "$($dataset.url)" -OutFile "$($dataset.output)"
    Write-Host "complete" -ForegroundColor Green
}
