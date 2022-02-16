if type rbenv &>/dev/null; then
    export RBENV_ROOT="$HOME/.rbenv"
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi
