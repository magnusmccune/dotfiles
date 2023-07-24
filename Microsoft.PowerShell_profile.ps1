oh-my-posh --init --shell pwsh --config "C:\DATA\repos\dotfiles\magnus.profile.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

$env:AZ_ENABLED = $true

# Source Control
function g { Set-Location c:/DATA/repos }
function gcom
{
	git add .
	git commit -m "$args"`
}
function lazyg
{
	git add .
	git commit -m "$args"
	git push
}

# Utilities

Function Get-PubIP {
 (Invoke-WebRequest http://ifconfig.me/ip ).Content
}