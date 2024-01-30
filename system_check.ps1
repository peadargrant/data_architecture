#!/usr/bin/env pwsh
# System check script

Function Test-CommandExists {
    Param ($command)
    try {
	if(Get-Command $command) {
	    RETURN $true
	}
    } Catch {
	Write-Host "$command does not exist"
	RETURN $false
    } 
}

$requiredCommands = @("ssh", "git")

$problems = $False

Write-Host 'System check for Tools for SD' -ForegroundColor Cyan

foreach ( $command in $requiredCommands ) {
    Write-Host "checking for $command ... " -NoNewLine
    if ( Test-CommandExists $command ) {
	Write-Host "found" -ForegroundColor Green
    }
    else {
	Write-Host "not found" -ForegroundColor Red
	$problems = $True
    }
}

if ( $problems ) {
    Write-Host 'fix reported issues and re-run script again to check' -BackgroundColor Red -ForegroundColor White
}
else {
    Write-Host 'your system looks OK for this module' -BackgroundColor Green -ForegroundColor White
}

