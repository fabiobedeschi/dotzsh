export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if type pyenv &>/dev/null; then
    _evalcache pyenv init --path
    _evalcache pyenv init -

    if [ ! -d "$HOME/.pyenv" ]; then
        ln -sFi "$PYENV_ROOT" "$HOME/.pyenv"
    fi
fi
