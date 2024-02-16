#!/bin/bash

# Script for prepare Debian
# 2022 - Manz (manz.dev)

export DEBIAN_FRONTEND=noninteractive

# Update linux
sudo apt-get autoremove -y
sudo apt-get upgrade -y

# Essentials
sudo apt-get install -y \
  bash zsh zgen sudo wget git g++ make gnupg gnupg2 ca-certificates lsb-release \
  vim nano libbrotli-dev cmake \
  ccze jq less catimg nnn zoxide \
  tldr curl httpie man googler ddgr neofetch \
  htop ncdu icdiff \
  unzip zip bzip2 p7zip-full \
  locales locales-all \
  bat exa \
  sl lolcat cmatrix ffmpeg
# Update tldr
tldr -u
# Fix batcat -> bat
sudo ln -s /usr/bin/batcat /usr/local/bin/bat

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo source $HOME/.dotfiles/.zshrc >> ~/.zshrc

PNPM_HOME=$HOME/.local/share/pnpm
PATH=$HOME/bin:/usr/local/bin:$HOME/.nvm:/usr/local/go/bin:$HOME/.deno/bin:$HOME/.cargo/bin:/usr/share/go/bin:$PNPM_HOME:$PATH

# Go install
wget --quiet https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
tar -xvf go1.22.0.linux-amd64.tar.gz
sudo mv go /usr/share
rm go1.22.0.linux-amd64.tar.gz

# Go installations
go install github.com/muesli/duf@latest
go install github.com/charmbracelet/glow@latest

# Deno install
curl -fsSL https://deno.land/x/install/install.sh | sh

# Node/NPM/PNPM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.0.0-rc.7 sh -
source $HOME/.nvm/nvm.sh
nvm install --lts
npm install -g svgo wipeclean ttf2woff

# Rust install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Cargo installations
sudo apt-get install libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev -y
cargo install jless
cargo install zellij
cargo install hyperfine

# Docker install
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Micro install
curl https://getmic.ro | sudo bash
sudo mv micro /usr/local/bin

# Woff2
git clone https://github.com/google/woff2.git
cd woff2
mkdir out
cd out
cmake ..
make && sudo make install
sudo cp woff2_* /usr/local/bin/
cd ..
cd ..
rm -rf woff2

# Change to ZSH
sudo chsh -s /usr/bin/zsh

zsh
