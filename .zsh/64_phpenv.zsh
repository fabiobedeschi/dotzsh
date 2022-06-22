export PHPENV_ROOT="$HOME/.phpenv"
export PATH="$PHPENV_ROOT/bin:$PATH"

if type phpenv &>/dev/null; then
    _evalcache phpenv init -

    if [ ! -d "$HOME/.phpenv" ]; then
        ln -sFi "$PHPENV_ROOT" "$HOME/.phpenv"
    fi

    # phpenv install alias
    # alias 'phpenv install'='CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) --with-bz2=$(brew --prefix bzip2) --with-curl=$(brew --prefix curl) --with-iconv=$(brew --prefix libiconv) --with-libedit=$(brew --prefix libedit) --with-readline=$(brew --prefix readline) --with-tidy=$(brew --prefix tidy-html5)" phpenv install'
fi
