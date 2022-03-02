export NODENV_ROOT="$Z4H/nodenv/nodenv"
if [ -d "$NODENV_ROOT/bin" ]; then
    export PATH="$NODENV_ROOT/bin:$PATH"
    ln -sFf "$HOME/.nodenv"{,} && ln -sFf "$NODENV_ROOT" "$HOME/.nodenv"
    eval "$(nodenv init -)"
fi
