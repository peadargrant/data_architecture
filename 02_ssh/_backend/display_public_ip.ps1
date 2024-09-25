#!/usr/bin/env pwsh
# Display Public IP for SSH lab
# NOT for student use
# Peadar Grant

$output = (aws cloudformation describe-stacks --stack-name sshlabbackend | ConvertFrom-Json).Stacks[0].Outputs | Where-Object OutputKey -eq LinuxIP
Write-Host $output.OutputValue



