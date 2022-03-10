export RBENV_ROOT="$Z4H/rbenv/rbenv"
if [ -d "$RBENV_ROOT/bin" ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"

    if [ ! -d "$HOME/.rbenv" ]; then
        ln -sFi "$RBENV_ROOT" "$HOME/.rbenv"
    fi
fi
