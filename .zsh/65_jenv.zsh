export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"

if type jenv &>/dev/null; then
    _evalcache jenv init -

    if [ ! -d "$HOME/.jenv" ]; then
        ln -sFi "$JENV_ROOT" "$HOME/.jenv"
    fi
fi
