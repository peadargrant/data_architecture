#!/usr/bin/env pwsh
# Test connectivity to DB server for DkIT VPN

$TargetHost = "10.200.172.60"

Write-Host "Testing connectivity through VPN to $TargetHost..."

if ( Test-Connection -TargetName $TargetHost -TCPPort 22 ) {
    Write-Host "your connection is ok." -ForegroundColor Green
}
else {
    Write-Host "could not connect to $TargetHost" -ForegroundColor Red
}



