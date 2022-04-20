export NODENV_ROOT="$HOME/.nodenv"
if type nodenv &>/dev/null; then
    export PATH="$NODENV_ROOT/bin:$PATH"
    eval "$(nodenv init -)"

    if [ ! -d "$HOME/.nodenv" ]; then
        ln -sFi "$NODENV_ROOT" "$HOME/.nodenv"
    fi
fi
