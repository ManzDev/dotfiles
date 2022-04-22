# ManzDev dotfiles

- ZSH + OH-MY-ZSH + Agnoster theme + Completion plugins
- Essentials tools (wget, git, make...)
- CLI Editors (vim, nano, micro)
- CLI tools (ccze, jq, jless, catimg, nnn, z, htop, ncdu, icdiff...)
- API/Request tools (curl, http, googler, ddgr...)
- Help + fun (man, tldr, sl, lolcat, wipeclean)
- Compressors/conversors (unzip, zip, p7zip, svgo, ttf2woff, woff2)
- Modern commands (bat, exa, glow, duf, zellij, hyperfine)
- Language + Package Managers (Go / Rust / Deno)
- Node / NVM / PNPM
- Docker

## Installation

```bash
git clone https://github.com/manzdev/dotfiles ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

* Note: Do not run as root/sudo this file!

## Requisites

If you haven't a non-root user with sudo privileges, create it before run this script:

```bash
adduser manz --quiet
usermod -aG sudo manz
apt-get update -y && apt-get install -y sudo git
su manz
```

## More info

![Modern commands](https://pbs.twimg.com/media/FQZHmm5aIAkTXEw?format=jpg&name=small)

- 1: https://twitter.com/Manz/status/1514983676739739658
- 2: https://twitter.com/Manz/status/1516430573451059214

