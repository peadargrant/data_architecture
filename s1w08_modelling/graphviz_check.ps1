# Checks for cloud setup lab

# commands expected
$commands = @(
    @{
	command = "dot";
	link = "https://graphviz.org/download/"
    }
)

foreach ( $command in $commands ) {
    Write-Host "checking for $($command.command) command... " -NoNewline
    if ( Get-command $command.command ) {
        Write-Host "OK"
    }
    else {
        Write-Host "not found" -ForegroundColor Red
        Write-Host "  -- install from $($command.link)"
    }

}
