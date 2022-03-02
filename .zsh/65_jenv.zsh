export JENV_ROOT="$Z4H/jenv/jenv"
if [ -d "$JENV_ROOT/bin" ]; then
    export PATH="$JENV_ROOT/bin:$PATH"
    ln -sFf "$HOME/.jenv"{,} && ln -sFf "$JENV_ROOT" "$HOME/.jenv"
    eval "$(jenv init -)"
fi
