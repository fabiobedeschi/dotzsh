export NODENV_ROOT="$HOME/.nodenv"
if [ -d "$NODENV_ROOT/bin" ]; then
    export PATH="$NODENV_ROOT/bin:$PATH"
    eval "$(nodenv init -)"

    if [ ! -d "$HOME/.nodenv" ]; then
        ln -sFi "$NODENV_ROOT" "$HOME/.nodenv"
    fi
fi
