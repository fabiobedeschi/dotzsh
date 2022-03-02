export PYENV_ROOT="$Z4H/pyenv/pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    mkdir -p "$PHPENV_ROOT/plugins" && ln -sFf "$Z4H/pyenv/pyenv-virtualenv" "$PYENV_ROOT/plugins/"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
