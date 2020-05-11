if [ -f "$HOME/.zshrc" ]; then
  . "$HOME/.zshrc"
fi

if [[ -e "$HOME/.scripts/env/env.zprofile" ]]; then
  source "$HOME/.scripts/env/env.zprofile"
fi
