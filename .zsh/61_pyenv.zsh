export PYENV_ROOT="$Z4H/pyenv/pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    mkdir -p "$PYENV_ROOT/plugins" && ln -sFf "$Z4H/pyenv/pyenv-virtualenv" "$PYENV_ROOT/plugins/"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    if [ ! -d "$HOME/.pyenv" ]; then
        ln -sFi "$PYENV_ROOT" "$HOME/.pyenv"
    fi
fi
