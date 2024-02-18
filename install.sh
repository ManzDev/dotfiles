#!/bin/bash

# Script for prepare Debian
# 2022 - Manz (manz.dev)

export DEBIAN_FRONTEND=noninteractive

# Update linux
sudo apt-get autoremove -y
sudo apt-get upgrade -y

# Essentials
# zsh es un potente intérprete de comandos para sistemas operativos de tipo Unix
# sudo otorga a los usuarios no root acceso temporal a los privilegios elevados
# Zgen le proporciona algunos comandos simples para administrar complementos. Mantén tu .zshrc limpio y simple.
# wget para recuperar contenido y archivos de varios servidores web
# lsb_release -a te da la distro de linux que tienes
# vim y nano procesadores de textos
# libbrotli-dev compresor
# jq para extraer una parte de un json
# less es el paginador (para que al hacer un cat no muestre el final de un texto largo directamente)
# catimg para ver una imagen en terminal
# zoxide usando el comando z [nombre de carpeta en la que ya has estado] te evitas tener que meter rutas completas
# tldr manual version corta de los comandos man es lo mismo pero mas texto
# curl accede o descarga un fichero httpie comando http hace lo mismo pero te da mas info
# googler y ddgr te da en texto los resultados de google
# neofetch informacion de sistema
# htop informacion de uso de sistema
# unzip zip bzip2 p7zip-full compresores
# ncdu comando  para ver uso de disco duro
# icdiff o diff para ver diferencias entre 2 ficheros
# locales locales-all para evitar problemas de idiomas
# bat alternativa a cat (modificado con alias para que cat sea bat)
# exa alternativa a ls (modificado con alias para que ls sea exa)
# lolcat alternativa a cat con el texto multicolor con pipe lolcat 
# cmatrix salvapantallas tipo matrix
# ffmpeg utilidad de video





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

# Fix batcat -> bat
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
tldr -u
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

# Node/NPM/PNPM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
curl -fsSL https://get.pnpm.io/install.sh
source $HOME/.nvm/nvm.sh
nvm install --lts
npm install -g svgo wipeclean ttf2woff

# Go installations
go install github.com/muesli/duf@latest
go install github.com/charmbracelet/glow@latest







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
