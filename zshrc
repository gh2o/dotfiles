#### ZSH SETUP

if [[ -e $HOME/dotfiles ]]; then
	DOTFILES=$HOME/dotfiles
elif [[ -e /etc/dotfiles ]]; then
	DOTFILES=/etc/dotfiles
else
	echo "warning: dotfiles not found!" >&2
fi

ZSH="${DOTFILES}/oh-my-zsh"
ZSH_THEME=gentoo

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
HIST_IGNORE_SPACE="true"

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
RPROMPT="$RPROMPT"'%(1j.%{$fg_bold[magenta]%}{%j}%{$reset_color%}.)'

if [[ "$(uname -s)" == "SunOS" ]]; then
	PROMPT="$(echo $PROMPT | sed 's/git_prompt_info/true/')"
fi

HISTSIZE=1000000
SAVEHIST=1000000

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
export PYTHONSTARTUP=${DOTFILES}/pyrc
if [ -n "$GREP_OPTIONS" ]; then
	alias grep="grep $GREP_OPTIONS"
	unset GREP_OPTIONS
else
	echo "GREP_OPTIONS is no longer set by oh-my-zsh, remove me from zshrc" >&2
fi

#### ALIASES

if [[ "$(uname -s)" == "Linux" ]]; then
	alias open=xdg-open
fi

append_to_path() {
	PATH="$PATH:$1"
}

#### CUSTOM

[[ -e "${HOME}/.zshrc.user" ]] && source "${HOME}/.zshrc.user"

#### EXIT PEACEFULLY

true
