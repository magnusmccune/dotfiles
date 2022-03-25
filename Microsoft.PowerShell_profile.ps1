oh-my-posh --init --shell pwsh --config "C:\DATA\repos\dotfiles\magnus.profile.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

$env:AZ_ENABLED = $true