# ManzDev dotfiles modificado para mi

Script to prepare your GNU/Linux terminal (WSL also) in a «superterminal» with modern, autocompleted commands and other features.

## Includes

- **Shell**: ZSH + OH-MY-ZSH + Agnoster theme
- **Plugins**: Zgen plugin manager + History & Red/green completion commands
- **Essentials tools**: wget + git + make + cmake + g++
- **CLI Editors**: vim + nano + micro
- **CLI tools**: ccze + jq + nnn
- **API/Request tools**: curl + http + googler + ddgr
- **Help/Info**: man + tldr + neofetch
- **Fun**: sl + lolcat + wipeclean + cmatrix
- **Compressors/conversors**: unzip + zip + bzip2 + p7zip + svgo + ttf2woff + woff2 + ffmpeg
- **Language + Package Managers**: Go + Rust + Deno + Node/NVM/PNPM
- **Containers**: Docker

| **Modern commands** |
|-|
| bat (cat) |
| exa (ls, tree) |
| glow (cat .md) |
| jless (cat .json) |
| catimg (image cat) |
| duf (df) |
| ncdu (du) |
| zoxide (cd) |
| htop (top) |
| icdiff (diff) |
| zellij (tmux) |
| hyperfine (time) |

## Installation

```bash
git clone git@github.com:Santiagomadaw/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

* Note: Do not run as root/sudo this file!

## Requisites

If you haven't a non-root user with sudo privileges, create it before run this script:

# desde root

```su root```
o
```sudo su```

```bash
#en caso de no haber creado usuario
adduser [USER] --quiet 
usermod -aG sudo [USER]
apt-get update -y && apt-get install -y sudo git
su [USER]
```

## More info

![Modern commands](https://pbs.twimg.com/media/FQZHmm5aIAkTXEw?format=jpg&name=small)

- 1: https://twitter.com/Manz/status/1514983676739739658
- 2: https://twitter.com/Manz/status/1516430573451059214

