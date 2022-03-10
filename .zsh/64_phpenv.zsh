export PHPENV_ROOT="$Z4H/phpenv/phpenv"
if [ -d "$PHPENV_ROOT/bin" ]; then
    export PATH="$PHPENV_ROOT/bin:$PATH"
    mkdir -p "$PHPENV_ROOT/plugins" && ln -sFf "$Z4H/php-build/php-build" "$PHPENV_ROOT/plugins/"
    eval "$(phpenv init -)"

    if [ ! -d "$HOME/.phpenv" ]; then
        ln -sFi "$PHPENV_ROOT" "$HOME/.phpenv"
    fi
fi
