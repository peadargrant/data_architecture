#!/usr/bin/env pwsh
# SSH lab backend setup on AWS cloud
# (NOT needed by students!)
# Peadar Grant

$StackName='sshlabbackend'

aws cloudformation create-stack --stack-name $StackName --template-body file://backend_template.yml

Write-Host 'waiting for stack to complete'
aws cloudformation wait stack-create-complete --stack-name $StackName

Write-Host 'Done!'


