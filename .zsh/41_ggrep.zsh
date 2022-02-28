if type ggrep &> /dev/null; then
    # Alias for GNU grep
    alias grep='ggrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
fi
