export RBENV_ROOT="$HOME/.rbenv"
if type rbenv &>/dev/null; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"

    if [ ! -d "$HOME/.rbenv" ]; then
        ln -sFi "$RBENV_ROOT" "$HOME/.rbenv"
    fi
fi
