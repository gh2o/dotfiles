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
unsetopt sharehistory
unsetopt correctall
unsetopt nomatch

bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

#### ENVIRONMENT SETUP

[[ -e "${HOME}/bin" ]] && export PATH="${HOME}/bin:${PATH}"
[[ -e "${HOME}/homebrew/bin" ]] && export PATH="${HOME}/homebrew/bin:${PATH}"
export EDITOR=vim
export LESS="-M -R -i"
export PYTHONSTARTUP=${HOME}/.pyrc
