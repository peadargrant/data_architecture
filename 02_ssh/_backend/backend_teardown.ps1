#!/usr/bin/env pwsh
# Tear down backend for SSH lab on AWS Cloud
# NOT needed by students!
# Peadar Grant

$StackName='sshlabbackend'

aws cloudformation delete-stack --stack-name $StackName

Write-Host 'waiting for stack deletion'
aws cloudformation wait stack-delete-complete --stack-name $StackName
Write-Host 'Done!'
