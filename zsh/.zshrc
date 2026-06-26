# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(z git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="$HOME/.nvim/bin:$PATH"
export PATH="$HOME/.mimocode/bin:$PATH"

# Vite+
[ -f "$HOME/.vite-plus/env" ] && source "$HOME/.vite-plus/env"

# Git aliases
[ -f "$HOME/.bash_git" ] && source "$HOME/.bash_git"
