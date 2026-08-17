# Keys that used to be set up by zsh4humans. `bindkey -e` is in ~/.zshrc, so
# bindings added by earlier modules survive.

# Navigation.
bindkey '^[[H'    beginning-of-line          # home
bindkey '^[[1~'   beginning-of-line          # home (tty, urxvt)
bindkey '^[[F'    end-of-line                # end
bindkey '^[[4~'   end-of-line                # end (tty, urxvt)

# Word-wise movement and deletion.
bindkey '^[[1;5D' backward-word              # ctrl+left
bindkey '^[[1;5C' forward-word               # ctrl+right
bindkey '^[[1;3D' backward-word              # alt+left
bindkey '^[[1;3C' forward-word               # alt+right
bindkey '^[^?'    backward-kill-word         # alt+backspace
bindkey '^[[3;5~' kill-word                  # ctrl+delete
bindkey '^[[3;3~' kill-word                  # alt+delete
bindkey '^[d'     kill-word                  # alt+d
bindkey '^[k'     backward-kill-line         # alt+k
bindkey '^[j'     kill-buffer                # alt+j

# Undo and redo.
bindkey '^Z'      undo                       # ctrl+z
bindkey '^[^Z'    redo                       # ctrl+alt+z
bindkey '^[[Z'    undo                       # shift+tab

# Expand aliases, globs and parameters in place.
function expand-alias-glob() {
	zle _expand_alias
	zle expand-word
}
zle -N expand-alias-glob
bindkey '^ '      expand-alias-glob          # ctrl+space

# Show help for the command at the cursor.
(( $+aliases[run-help] )) && unalias run-help
autoload -Uz run-help
bindkey '^[h'     run-help                   # alt+h

# Text selection with shift+arrows, like a regular editor. Each select-<widget>
# starts the region at the cursor (if not already selecting) and runs <widget>.
function _select-widget() {
	(( REGION_ACTIVE )) || MARK=$CURSOR
	REGION_ACTIVE=1
	zle "${WIDGET#select-}"
}
for _w in backward-char forward-char backward-word forward-word \
          beginning-of-line end-of-line up-line down-line; do
	eval "function select-$_w() { _select-widget }"
	zle -N select-$_w
done
unset _w

# Any other widget collapses the selection, the way a caret does everywhere else.
autoload -Uz add-zle-hook-widget
function _collapse-region() { [[ $LASTWIDGET == select-* ]] || REGION_ACTIVE=0 }
add-zle-hook-widget line-pre-redraw _collapse-region

# Backspace and delete remove the selection when there is one.
function delete-region-or-backward-char() {
	(( REGION_ACTIVE )) && { zle kill-region; return }
	zle backward-delete-char
}
function delete-region-or-delete-char() {
	(( REGION_ACTIVE )) && { zle kill-region; return }
	zle delete-char
}
zle -N delete-region-or-backward-char
zle -N delete-region-or-delete-char
bindkey '^?'      delete-region-or-backward-char
bindkey '^H'      delete-region-or-backward-char
bindkey '^[[3~'   delete-region-or-delete-char

bindkey '^[[1;2D' select-backward-char       # shift+left
bindkey '^[[1;2C' select-forward-char        # shift+right
bindkey '^[[1;2A' select-up-line             # shift+up
bindkey '^[[1;2B' select-down-line           # shift+down
bindkey '^[[1;6D' select-backward-word       # ctrl+shift+left
bindkey '^[[1;6C' select-forward-word        # ctrl+shift+right
bindkey '^[[1;4D' select-backward-word       # alt+shift+left
bindkey '^[[1;4C' select-forward-word        # alt+shift+right
bindkey '^[[1;2H' select-beginning-of-line   # shift+home
bindkey '^[[1;2F' select-end-of-line         # shift+end

# Make sure the fzf history search owns ctrl+r even if something rebound it.
(( $+widgets[fzf-history-widget] )) && bindkey '^R' fzf-history-widget
