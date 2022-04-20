export JENV_ROOT="$HOME/.jenv"
if type jenv &>/dev/null; then
    export PATH="$JENV_ROOT/bin:$PATH"
    eval "$(jenv init -)"

    if [ ! -d "$HOME/.jenv" ]; then
        ln -sFi "$JENV_ROOT" "$HOME/.jenv"
    fi
fi
