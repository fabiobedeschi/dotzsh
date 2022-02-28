export JENV_ROOT="$HOME/.jenv"
if [ -d "$JENV_ROOT/bin" ]; then
    export PATH="$JENV_ROOT/bin:$PATH"
    eval "$(jenv init -)"
fi
