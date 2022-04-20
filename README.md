# ManzDev dotfiles

- ZSH / OH-MY-ZSH with Agnoster theme and completion plugins
- Essentials tools (wget, git, make...)
- Editors (vim, nano, micro)
- CLI tools (ccze, jq, jless, catimg, nnn, z, htop, ncdu, icdiff...)
- Requests (curl, http, googler, ddgr...)
- Help & fun (man, tldr, sl, lolcat, wipeclean)
- Compressors/conversors (unzip, zip, p7zip, svgo, ttf2woff, woff2)
- Go / Rust
- Docker
- Deno / Node / NVM / PNPM
- Modern commands (bat, exa, glow, duf, zellij, hyperfine)

## Installation

```bash
git clone https://github.com/manzdev/dotfiles ~/.dotfiles
cd ~/.dotfiles
sh install.sh
```

* Note: Do not run as root/sudo this file!

## Requisites

- Use a non-root user (for example, manz). Create it:

```bash
adduser manz --quiet
usermod -aG sudo manz
apt-get update -y && apt-get install -y sudo git
```

## More info

![Modern commands](https://pbs.twimg.com/media/FQZHmm5aIAkTXEw?format=jpg&name=small)

- 1: https://twitter.com/Manz/status/1514983676739739658
- 2: https://twitter.com/Manz/status/1516430573451059214

