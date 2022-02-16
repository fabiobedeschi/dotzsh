if type nodenv &>/dev/null; then
    export NODENV_ROOT="$HOME/.nodenv"
    export PATH="$NODENV_ROOT/bin:$PATH"
    eval "$(nodenv init -)"
fi
