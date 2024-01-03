if type fzf >/dev/null 2>&1; then
  if type fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd -u --type f'
  elif type ag >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'
  fi
fi

