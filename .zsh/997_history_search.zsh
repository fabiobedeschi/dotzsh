# Up/down search the history for entries matching what is already typed.
# Upstream asks to be loaded after zsh-syntax-highlighting.
plug zsh-users/zsh-history-substring-search

HISTORY_SUBSTRING_SEARCH_FUZZY=''
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

bindkey '^[[A'  history-substring-search-up     # up
bindkey '^[[B'  history-substring-search-down   # down
bindkey '^P'    history-substring-search-up     # ctrl+p
bindkey '^N'    history-substring-search-down   # ctrl+n
