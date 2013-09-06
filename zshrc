#### ZSH SETUP

ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME=gentoo

CASE_SENSITIVE="true"

plugins=(git gitfast)

if [[  "$(uname -m)" == "mips" ]]; then
	plugins=()
fi

if [[ "$(uname -s)" == "SunOS" ]]; then
	plugins=()
	DISABLE_LS_COLORS=true
fi

source $ZSH/oh-my-zsh.sh
RPROMPT='%(?..%{$fg_bold[red]%}[%?]%{$reset_color%})'

if [[ "$(uname -s)" == "SunOS" ]]; then
	PROMPT="$(echo $PROMPT | sed 's/git_prompt_info/true/')"
fi

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

compdef -d nm strip # their completion ignores most files
zstyle ':completion:*' matcher-list 'r:|=*' # basic non-substring completion

#### ENVIRONMENT SETUP

[[ -e "${HOME}/bin" ]] && export PATH="${HOME}/bin:${PATH}"
[[ -e "${HOME}/homebrew/bin" ]] && export PATH="${HOME}/homebrew/bin:${PATH}"
export EDITOR=vim
export LESS="-M -R -i"
export PYTHONSTARTUP=${HOME}/.pyrc

#### CUSTOM

[[ -e "${HOME}/.zshrc.user" ]] && source "${HOME}/.zshrc.user"
