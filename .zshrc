# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [[ -e "$HOME/.scripts/env/env.zshrc" ]]; then
  source "$HOME/.scripts/env/env.zshrc"
fi

alias aurupdate="yay -Syu"
alias update="sudo pacman -Syyu"
alias termart="$HOME/.toys/termart"
alias ta=termart
alias open="xdg-open"
alias plz="sudo !!"
alias install="sudo pacman -S"
alias ..="cd .."
alias grep="grep --color=auto"
alias ls="ls --color"

# Quick command navigation
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Dirstack - https://wiki.archlinux.org/index.php/Zsh#Sample_.zshrc_files
autoload -Uz add-zsh-hook

# Ranger
#   https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

# Prompt themes - https://wiki.archlinux.org/index.php/Zsh#Prompt_themes
autoload -Uz promptinit
promptinit
# My Settings
prompt fade blue
