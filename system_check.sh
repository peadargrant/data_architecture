#!/bin/bash
# System check script for Tools for SD (linux / mac)

if ! command -v pwsh &> /dev/null
then
    echo "PowerShell could not be found"
    echo "Install from Package Manager or Microsoft Online"
    echo "Recommend you talk to your lecturer for help!"
    exit 1
fi

echo "System checks for Tools for SD"
echo "PowerShell appears to be installed!"
./system_check.ps1

