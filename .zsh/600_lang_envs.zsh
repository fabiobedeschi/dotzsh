export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if type pyenv &>/dev/null; then

    _evalcache pyenv init - no_completion
    export PYENV_SHELL=zsh

    if [ ! -d "$HOME/.pyenv" ]; then
        ln -sFi "$PYENV_ROOT" "$HOME/.pyenv"
    fi
fi


export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
if type nodenv &>/dev/null; then

    _evalcache nodenv init - nocompletions
    export NODENV_SHELL=zsh

    if [ ! -d "$HOME/.nodenv" ]; then
        ln -sFi "$NODENV_ROOT" "$HOME/.nodenv"
    fi
fi


export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if type rbenv &>/dev/null; then

    _evalcache rbenv init - no_completion
    export RBENV_SHELL=zsh

    if [ ! -d "$HOME/.rbenv" ]; then
        ln -sFi "$RBENV_ROOT" "$HOME/.rbenv"
    fi
fi


export PHPENV_ROOT="$HOME/.phpenv"
export PATH="$PHPENV_ROOT/bin:$PATH"
if type phpenv &>/dev/null; then

    _evalcache phpenv init - nocompletions
	export PHPENV_SHELL=zsh

    if [ ! -d "$HOME/.phpenv" ]; then
        ln -sFi "$PHPENV_ROOT" "$HOME/.phpenv"
    fi

    # phpenv install alias
    # alias 'phpenv install'='CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) --with-bz2=$(brew --prefix bzip2) --with-curl=$(brew --prefix curl) --with-iconv=$(brew --prefix libiconv) --with-libedit=$(brew --prefix libedit) --with-readline=$(brew --prefix readline) --with-tidy=$(brew --prefix tidy-html5)" phpenv install'
fi


export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
if type jenv &>/dev/null; then

    _evalcache jenv init -

    if [ ! -d "$HOME/.jenv" ]; then
        ln -sFi "$JENV_ROOT" "$HOME/.jenv"
    fi
fi
