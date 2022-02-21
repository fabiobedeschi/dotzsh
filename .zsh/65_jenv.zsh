if type jenv &>/dev/null; then
    export JENV_ROOT="$HOME/.jenv"
    export PATH="$JENV_ROOT/bin:$PATH"
    eval "$(jenv init -)"
fi
