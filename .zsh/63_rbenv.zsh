export RBENV_ROOT="$HOME/.rbenv"
if [ -d "$RBENV_ROOT/bin" ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi
