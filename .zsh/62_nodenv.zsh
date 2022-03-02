export NODENV_ROOT="$Z4H/nodenv/nodenv"
if [ -d "$NODENV_ROOT/bin" ]; then
    export PATH="$NODENV_ROOT/bin:$PATH"
    eval "$(nodenv init -)"
fi
