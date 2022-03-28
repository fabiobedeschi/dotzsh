export PHPENV_ROOT="$HOME/.phpenv"
if [ -d "$PHPENV_ROOT" ]; then
    export PATH="$PHPENV_ROOT/bin:$PATH"
    eval "$(phpenv init -)"

    if [ ! -d "$HOME/.phpenv" ]; then
        ln -sFi "$PHPENV_ROOT" "$HOME/.phpenv"
    fi
fi
