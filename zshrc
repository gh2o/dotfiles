#### ZSH SETUP

ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME=gentoo

CASE_SENSITIVE="true"
plugins=(git gitfast)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000

setopt noautomenu
setopt extendedglob
setopt correct
unsetopt correctall

#### ENVIRONMENT SETUP

[[ -e "${HOME}/bin" ]] && export PATH="${HOME}/bin:${PATH}"
export EDITOR=vim
export LESS="-M -R"
export PYTHONSTARTUP=${HOME}/.pyrc
