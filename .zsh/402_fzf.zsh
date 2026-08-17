# fzf used to come bundled with zsh4humans. Install our own copy unless the
# system has one recent enough for `fzf --zsh` (fzf >= 0.48).
if ! fzf --zsh >/dev/null 2>&1; then
  if [[ ! -x $HOME/.fzf/bin/fzf ]] && type git >/dev/null 2>&1; then
    git clone -q --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf" &&
      "$HOME/.fzf/install" --bin --no-update-rc >/dev/null
  fi
  [[ -d $HOME/.fzf/bin ]] && path=("$HOME/.fzf/bin" $path)
fi

if type fzf >/dev/null 2>&1; then
  if type fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd -u --type f'
  elif type ag >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'
  fi

  export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border=horizontal --exact --no-mouse'
  # Show the full command of the highlighted history entry.
  export FZF_CTRL_R_OPTS='--preview="printf %s {2..}" --preview-window=down:3:wrap'
  export FZF_ALT_C_OPTS='--preview="ls -1 {} 2>/dev/null | head -50"'

  # Ctrl+R history search, Ctrl+T file picker, Alt+C cd picker, ** completion.
  fzf --zsh >/dev/null 2>&1 && _evalcache fzf --zsh
fi
