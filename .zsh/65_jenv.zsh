export JENV_ROOT="$Z4H/jenv/jenv"
if [ -d "$JENV_ROOT/bin" ]; then
    export PATH="$JENV_ROOT/bin:$PATH"
    eval "$(jenv init -)"
fi
