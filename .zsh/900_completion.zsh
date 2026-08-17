# Runs after every other module so that additions to fpath (~/.zsh/completions,
# homebrew site-functions, zsh-completions) are all visible to compinit.
plug zsh-users/zsh-completions

_zcompdump=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION
[[ -d ${_zcompdump:h} ]] || mkdir -p ${_zcompdump:h}

autoload -Uz compinit
# ponytail: rebuild the dump at most once a day, -C skips the check in between
if [[ -n ${_zcompdump}(#qNmh-24) ]]; then
	compinit -C -d $_zcompdump
else
	compinit -d $_zcompdump
fi
unset _zcompdump

# Replay the compdef calls the modules queued before compinit existed.
for _cd in $_compdef_queue; do
	eval "compdef $_cd"
done
unset _compdef_queue _cd

zstyle ':completion:*'               matcher-list      'm:{a-z}={A-Z}'
zstyle ':completion:*'               menu              no
zstyle ':completion:*'               verbose           true
zstyle ':completion:*'               squeeze-slashes   true
zstyle ':completion:*'               single-ignored    show
zstyle ':completion:*'               use-cache         true
zstyle ':completion:*'               cache-path        ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache
zstyle ':completion:*'               list-colors       "${(@s.:.)LS_COLORS}"
zstyle ':completion:::::'            insert-tab        pending
zstyle ':completion:*:-subscript-:*' tag-order         'indexes parameters'
zstyle ':completion:*:functions'     ignored-patterns  '-*|_*'
zstyle ':completion:*:paths'         accept-exact-dirs true
zstyle ':completion:*:(rm|kill|diff):*' ignore-line     other
zstyle ':completion:*:rm:*'          file-patterns     '*:all-files'
zstyle ':completion:*:ssh:argument-1:*' sort           true

# fzf-driven tab completion, replacing z4h-fzf-complete.
if type fzf >/dev/null 2>&1; then
	plug Aloxaf/fzf-tab
	zstyle ':fzf-tab:*'             fzf-flags     --exact --no-mouse --color=hl:201,hl+:201
	zstyle ':fzf-tab:*'             switch-group  '<' '>'
	zstyle ':fzf-tab:complete:cd:*' fzf-preview   'ls -1 --color=always ${(Q)realpath} 2>/dev/null || ls -1 ${(Q)realpath}'
fi
