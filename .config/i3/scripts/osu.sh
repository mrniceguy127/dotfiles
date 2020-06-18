#!/bin/zsh

if [[ -e "$HOME/.scripts/env/env.zshrc" ]]; then
  source "$HOME/.scripts/env/env.zshrc"
fi

if [[ -n "$TERMATT" ]]; then
  $TERMATT osu-wine-rpc &
fi

osu-wine
