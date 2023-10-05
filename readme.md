# Instructions


## Windows
### Install Fonts

`Invoke-WebRequest https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -outfile c:/Temp/CascadiaCode.zip`

`Expand-Archive -LiteralPath 'c:/Temp/CascadiaCode.zip' -DestinationPath c:/temp/`

### Change git to rely on Windows Cert Store

`git config --global http.sslBackend schannel`

### Setup Azure Context 

`Connect-AzAccount -UseDeviceAuthentication`

`Set-AzContext -Name 'short-name' -Subscription 'sub_name' -Tenant '00000000-0000-0000-0000-000000000000'`

### Replace Powershell Profile

`Copy-Item "C:\DATA\repos\dotfiles\Microsoft.PowerShell_profile.ps1" -destination "C:\Users\$env:username\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"`

### Replace Terminal

`Copy-Item "C:\DATA\repos\dotfiles\Microsoft.Terminal\settings.json" -destination "C:\Users\$env:username\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"`

`Install-Module Terminal-Icons`

### Setup Windows for SSH Keygen

`ssh-keygen -t ed25519 -C "your_email@example.com"`

As Admin  
`Get-Service ssh-agent | Set-Service -StartupType Automatic`

Start the service  
`Start-Service ssh-agent`

Now load your key files into ssh-agent  
`ssh-add ~\.ssh\id_ed25519`

### Clarify

## Ubuntu

## Clone dotfiles to profile

```bash
cd ~

git clone https://github.com/magnusmccune/dotfiles
```

### Install OhMyPosh

```bash
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

sudo chmod +x /usr/local/bin/oh-my-posh
```

### Add to bashrc

add  

```bash
# OhMyPosh Setup
eval "$(oh-my-posh --init --shell bash --config ~/dotfiles/magnuslinux.profile.omp.json)"
```

 to bashrc  

### Set TimeZone

 `sudo timedatectl set-timezone America/...`

## MacOS

Install HomeBrew and Dependencies
```bash
# Install Command Line Tools for Xcode
sudo xcode-select --install

#Install HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add `/usr/local/bin` to global path `/etc/paths`

Update `.zshrc`

```bash
echo 'if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/magnusmccune/dotfiles/main/magnus.profile.omp.json')"
#    eval "$(oh-my-posh init zsh --config '~/projects/personal/dotfiles/magnus.profile.omp.json')"
fi' >> ~/.zshrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
echo 'alias d=docker
alias h=helm
alias k=kubectl
alias t=terraform
alias a=ansible
alias mp=multipass' >> ~/.zshrc
```

Add to  ~/.gitconfig
```
[includeIf "gitdir:~/Projects/personal/"]
	path = .gitconfig-personal
git config -f ~/.gitconfig-personal user.email john.doe@personal.com
```

``` BASH
ln -s /Users/$USER/projects/personal/dotfiles/BrewFile /Users/$USER/BrewFile
```
