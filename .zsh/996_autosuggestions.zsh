# Loaded after zsh-syntax-highlighting, as upstream recommends.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1   # must be set before sourcing: skips rebinding widgets on every prompt
plug zsh-users/zsh-autosuggestions

# Right arrow accepts the whole suggestion out of the box (forward-char is an
# accept widget), which is what `forward-char 'accept'` did under zsh4humans.
bindkey '^[m'   autosuggest-accept           # alt+m
