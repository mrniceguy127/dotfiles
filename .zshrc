# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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

alias update="yay -Syyu"
alias termart="$HOME/.toys/termart"
alias ta=termart
alias nue='ta nue'
alias kanna='ta kanna'
alias open="xdg-open"
#alias plz='sudo !!' # '!!: Command not found' ???
alias install="sudo pacman -S"
alias ..="cd .."
alias grep="grep --color=auto"
alias ls="ls --color"
alias may="MAKEFLAGS=\"-j$(nproc)\" yay"
alias f="ranger ."
alias v="vim"
alias c="cat"
alias pa="pulseaudio"
alias ga="git add ."
alias gp="git push"
alias gP="git pull"
alias p="python3"

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
#add-zsh-hook -Uz chpwd chpwd_dirstack

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

PROMPT_FIRST='%F{blue}%K{black}█▓▒░%f%k%F{15}%K{blue}%n@%m%f%F{blue}%k%K{black}▓▒░%f%k'
#PROMPT_GIT="[$(git branch 2> /dev/null | cut -d ' ' -f 2)]"
PROMPT_DATETIME="%K $(date +"%D %T")%f%k"
PROMPT_SECOND='%F{blue}%B%~ #%b%f '
PROMPT="$(printf '$PROMPT_FIRST$PROMPT_DATETIME\n$PROMPT_SECOND')"
