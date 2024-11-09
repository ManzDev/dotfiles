export DEBIAN_FRONTEND=noninteractive

sudo apt update -y
sudo apt install -y bash sudo wget git locales build-essential \
  vim nano ccze jq less catimg tldr curl httpie man htop ncdu \
  unzip zip bzip2 p7zip-full woff2 file imagemagick \
  bat sl lolcat cmatrix ffmpeg \
  libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev

tldr -u

# docker image support
export SHELL=/bin/bash

# fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install -all

# PNPM/Node
curl -fsSL https://get.pnpm.io/install.sh | sh -
source ~/.bashrc
pnpm env use -g 20
pnpm install -g svgo wipeclean ttf2woff emoj servor

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.bashrc
cargo install bat zoxide eza zellij hyperfine jless erdtree broot choose
{
  echo '--level 2'
  echo '--icons'
  echo '--human'
  echo '-s size'
} >> ~/.erdtreerc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

# Go
wget -q "https://go.dev/dl/go1.23.2.linux-amd64.tar.gz" -O - | sudo tar -C /usr/local -xzf -
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bashrc
go install github.com/muesli/duf@latest
go install github.com/charmbracelet/glow@latest

# Oh my posh
sudo apt install -y curl unzip fonts-powerline nano
curl -s https://ohmyposh.dev/install.sh | bash -s
{
  echo 'export PATH=$PATH:$HOME/.local/bin'
  echo 'eval "$(oh-my-posh init bash)"'
} >> ~/.bashrc

{
  echo "alias ls='eza -l --level 1 --icons'"
  echo "alias tree='erd'"
  echo "alias cat='batcat'"
} >> ~/.bashrc
