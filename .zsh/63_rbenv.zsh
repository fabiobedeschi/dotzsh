export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

if type rbenv &>/dev/null; then
    _evalcache rbenv init -

    if [ ! -d "$HOME/.rbenv" ]; then
        ln -sFi "$RBENV_ROOT" "$HOME/.rbenv"
    fi
fi
