ZSH_THEME="agnoster"
plugins=(git colored-man-pages)

# Reload theme
source $ZSH/oh-my-zsh.sh

# Load plugins
source /usr/share/zgen/zgen.zsh
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-completions

source ~/.dotfiles/.aliases

export PAGER="less"

# go
export GOPATH=/usr/share/go

# deno
export DENO_INSTALL=$HOME/.deno

# node
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME=$HOME/.local/share/pnpm

# zoxide
eval "$(zoxide init zsh)"
rm ~/.zcompdump*; compinit

# PATH
export PATH=$HOME/bin:/usr/games:/usr/local/bin:$HOME/.nvm:/usr/local/go/bin:$DENO_INSTALL/bin:$HOME/.cargo/bin:$GOPATH/bin:$PNPM_HOME:$PATH

echo "$(cat $HOME/.dotfiles/banner)" | lolcat
