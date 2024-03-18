#!/usr/bin/env pwsh

Write-Host 'delete stack... ' -NoNewline
aws cloudformation delete-stack --stack-name LAB
Write-Host 'OK' -ForegroundColor Green

Write-Host 'waiting for delete to complete... ' -NoNewline
aws cloudformation wait stack-delete-complete --stack-name LAB 
Write-Host 'OK' -ForegroundColor Green

