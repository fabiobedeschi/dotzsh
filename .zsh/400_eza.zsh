if type eza &> /dev/null; then
    alias exa=eza
    alias ls='eza --git --group-directories-first'
    alias tree='eza --tree'
    alias ltr=tree

    unalias lS
    unalias lart
    unalias lrt
    unalias lt
fi
