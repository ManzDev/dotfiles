#!/usr/bin/env bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

#####
# Antes de ejecutar el script:
#
# 1. No lo ejecutes con sudo
# 2. Ejecutalo como un usuario regular
##### 

sudo apt update -y
sudo apt install -y --no-install-recommends \
  curl fish sudo wget git ccze jq less man-db \
  vim nano htop ncdu locales unzip zip bzip2 file \
  imagemagick tmux sl build-essential ca-certificates libatomic1 \
	libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev \
	duf fonts-powerline

# --- Fish ---
export SHELL=$(which fish)
sudo chsh -s $SHELL $(whoami)

mkdir -p "$HOME/.config/fish"
touch "$HOME/.config/fish/config.fish"
fish_config_add() {
  grep -qxF "$1" "$HOME/.config/fish/config.fish" || echo "$1" >> "$HOME/.config/fish/config.fish"
}

fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install IlanCosman/tide@v6'

# Fuzzy Finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Install PNPM/Node/Deno
curl -fsSL https://get.pnpm.io/install.sh | sh -
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"
pnpm runtime set node lts -g
pnpm runtime set deno lts -g
pnpm install -g svgo wipeclean ttf2woff servor

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"
fish_config_add "set -gx PATH \$HOME/.cargo/bin \$PATH"
cargo install choose jless

# Install Go
GO_VERSION="1.22.5"
curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" -o /tmp/go.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf /tmp/go.tar.gz
rm /tmp/go.tar.gz
fish_config_add "set -gx PATH /usr/local/go/bin \$PATH"

# Install Python
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
fish_config_add "set -gx PATH \$HOME/.local/bin \$PATH"
uv python install 3.12

sudo DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
   catimg xh woff2 file glow bat eza zoxide lolcat ffmpeg cht.sh \
	 micro gh

# Alias
fish -c 'alias ls="eza --icons" && funcsave ls'
fish -c 'alias cat="batcat" && funcsave cat'
fish -c 'alias tree="eza --icons --tree -L 1 -I node_modules" && funcsave tree'

fish_config_add "zoxide init fish | source"

echo "✅ Instalación completa. Reinicia la terminal para cargar la configuración y escribe 'tide configure'."
exit 0
