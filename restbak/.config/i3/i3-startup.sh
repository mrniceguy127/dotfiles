#!/bin/zsh

if [[ -e "$HOME/.scripts/env/env.zshrc" ]]; then
  source "$HOME/.scripts/env/env.zshrc"
fi

if [[ -n "$TERMATT" ]]; then
  $TERMATT i3-startup
fi
