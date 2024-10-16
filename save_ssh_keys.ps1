#!/usr/bin/env pwsh 
# Copy SSH keys to OneDrive for lab
# Peadar Grant

# Repository path 
# (OneDrive for Business folder)
$RepoPath = Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts\Business1" | Select-Object -ExpandProperty "UserFolder"

# Target folder
$TargetFolder= Join-Path -Path $RepoPath -ChildPath .ssh

# Create target folder
New-Item -ItemType Directory -path $TargetFolder -Force

# SSH key path 
$SourceFolder = '~/.ssh'

# Make sure ssh key folder exists on Repository path 
if ( ! ( Test-Path $SourceFolder ) ) {
	throw("No .ssh folder exists")
}

# Files to Save
$files = @( 'id_ed25519', 'id_ed25519.pub' )

foreach ( $file in $files ) {
	
	Write-Host "saving $file"
	Copy-Item -Path $(Join-Path -Path $SourceFolder -ChildPath $file) -Destination $TargetFolder -Force
	
}

