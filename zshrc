ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME=gentoo

CASE_SENSITIVE="true"
plugins=(git gitfast)

source $ZSH/oh-my-zsh.sh

setopt noautomenu
setopt extendedglob
setopt correct
unsetopt correctall
