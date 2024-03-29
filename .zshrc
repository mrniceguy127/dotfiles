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



# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(
	#git
	archlinux
	jump
	perms
	sudo
	history-substring-search
	#per-directory-history
        dotenv
	dotnet
	github
	#gpg-agent ssh-agent keychain
	npm nvm
	tmux
        zsh-autosuggestions
	zsh-syntax-highlighting
	colorize
)
source "$ZSH/oh-my-zsh.sh"


# pywal
mkdir -p "$HOME/.cache/wal"
touch "$HOME/.cache/wal/sequences"
(cat ~/.cache/wal/sequences &)

# Quick command navigation
#   ctrl+left
bindkey "^[Od" backward-word
#   ctrl+right
bindkey "^[Oc" forward-word
#   ctrl+up
bindkey "^[[1;5A" beginning-of-line
#   ctrl+down
bindkey "^[[1;5B" end-of-line
#   ctrl+backspace
bindkey "^H" backward-kill-word
#   ctrl+del
bindkey "^[[3;5~" kill-word

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

PROMPT_FIRST='%F{blue}%K{black}░▒▓█%f%k%F{15}%K{blue}%n@%m%f%k%F{blue}%k%K{8}▓▒░%f%k'
#PROMPT_GIT="[$(git branch 2> /dev/null | cut -d ' ' -f 2)]"
#PROMPT_DATETIME="%K{8} $(date +"%D %T") %f%k"
PROMPT_DATETIME="%K{8} %~ %f%k"
PROMPT_SECOND='%F{white}%B#%b%f '

# Please change these variable names later bestie :)
PERCENT_K='%K'
PERCENT_k='%k'
PERCENT_F='%F'
PERCENT_f='%f'
PERCENT_B='%B'
PERCENT_b='%b'
PROMPT="$(printf '$PROMPT_FIRST$PROMPT_DATETIME$PERCENT_F{8}\ue0b0$PERCENT_f\n$PROMPT_SECOND')"


# Aliases

alias update="yay -Syyu"
alias termart="$HOME/.toys/termart"
alias pichu="termart pichu"
alias shaymin="termart shaymin"
alias open="xdg-open"
alias o="open"
alias plz='sudo $(fc -ln -1)'
alias install="sudo pacman -S"
alias grep="grep --color=auto"
alias ls="ls -shN --color=auto --group-directories-first"
alias may='MAKEFLAGS="-j$(nproc)" yay'
alias f='ranger .'
# Causes too many problems: alias cat='ccat'
alias c='cat'
alias pa='pulseaudio'
alias ga='git add .'
alias gp='git push'
alias gP='git pull'
alias python='python3'
alias p='python'
alias pki='pkill --signal=SIGKILL'
alias ram='ps axch -o cmd:15,%mem --sort=-%mem | head'
alias cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
alias cp='cp -iv'
alias mv='mv -iv'
alias mhz='watch -n 1 "cat /proc/cpuinfo | grep MHz"'
alias vi='vim'
alias v='vim'
alias slippi-online='slippi-online -u ~/.config/SlippiOnline/'

if [[ -e "$HOME/.scripts/env/zshrc" ]]; then
  source "$HOME/.scripts/env/zshrc"
fi
