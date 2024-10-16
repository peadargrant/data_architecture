#!/usr/bin/env pwsh 
# Restore SSH keys from OneDrive to lab
# Peadar Grant

# Repository path 
# (OneDrive for Business folder)
$RepoPath = Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts\Business1" | Select-Object -ExpandProperty "UserFolder"

# Source folder
$SourceFolder= Join-Path -Path $RepoPath -ChildPath .ssh

# SSH key path 
$TargetFolder = '~/.ssh'

# Create target folder
New-Item -ItemType Directory -path $TargetFolder -Force

# Make sure ssh key folder exists on Repository path 
if ( ! ( Test-Path $SourceFolder ) ) {
	throw("No .ssh folder exists on OneDrive")
}

# Files to Save
$files = @( 'id_ed25519', 'id_ed25519.pub' )

foreach ( $file in $files ) {
	
	Write-Host "saving $file"
	Copy-Item -Path $(Join-Path -Path $SourceFolder -ChildPath $file) -Destination $TargetFolder -Force
	
}

