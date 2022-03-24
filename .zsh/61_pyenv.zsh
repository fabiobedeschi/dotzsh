export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    if [ ! -d "$HOME/.pyenv" ]; then
        ln -sFi "$PYENV_ROOT" "$HOME/.pyenv"
    fi
fi
