export RBENV_ROOT="$Z4H/rbenv/rbenv"
if [ -d "$RBENV_ROOT/bin" ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    ln -sFf "$HOME/.rbenv"{,} && ln -sFf "$RBENV_ROOT" "$HOME/.rbenv"
    eval "$(rbenv init -)"
fi
