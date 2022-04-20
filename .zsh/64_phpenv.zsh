export PHPENV_ROOT="$HOME/.phpenv"
export PATH="$PHPENV_ROOT/bin:$PATH"

if type phpenv &>/dev/null; then
    _evalcache phpenv init -

    if [ ! -d "$HOME/.phpenv" ]; then
        ln -sFi "$PHPENV_ROOT" "$HOME/.phpenv"
    fi
fi
