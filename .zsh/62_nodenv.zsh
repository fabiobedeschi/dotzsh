export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"

if type nodenv &>/dev/null; then
    _evalcache nodenv init - nocompletions
    export NODENV_SHELL=zsh

    if [ ! -d "$HOME/.nodenv" ]; then
        ln -sFi "$NODENV_ROOT" "$HOME/.nodenv"
    fi
fi
