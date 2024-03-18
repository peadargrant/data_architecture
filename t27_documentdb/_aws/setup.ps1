#!/usr/bin/env pwsh

Write-Host 'creating stack... ' -NoNewline
aws cloudformation create-stack --stack-name LAB --template-body file://documentdb_template.yaml
Write-Host 'OK' -ForegroundColor Green

Write-Host 'waiting for create to complete... ' -NoNewline
aws cloudformation wait stack-create-complete --stack-name LAB 
Write-Host 'OK' -ForegroundColor Green

