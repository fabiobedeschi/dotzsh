export PHPENV_ROOT="$HOME/.phpenv"
if [ -d "$PHPENV_ROOT/bin" ]; then
    export PATH="$PHPENV_ROOT/bin:$PATH"
    eval "$(phpenv init -)"
fi
