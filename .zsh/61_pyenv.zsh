export PYENV_ROOT="$Z4H/pyenv/pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    mkdir -p "$PYENV_ROOT/plugins" && ln -sFf "$Z4H/pyenv/pyenv-virtualenv" "$PYENV_ROOT/plugins/"
    ln -sFf "$HOME/.pyenv"{,} && ln -sFf "$PYENV_ROOT" "$HOME/.pyenv"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
