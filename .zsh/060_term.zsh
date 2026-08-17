# Terminal window title: current directory when idle, running command otherwise.
function _term_title() { print -rn -- $'\e]0;'${(%)1}$'\a' }

function _term_title_precmd() {
	if [[ -n $SSH_CONNECTION ]]; then
		_term_title '%n@%m: %~'
	else
		_term_title '%~'
	fi
}

function _term_title_preexec() {
	if [[ -n $SSH_CONNECTION ]]; then
		_term_title "%n@%m: ${1//\%/%%}"
	else
		_term_title "${1//\%/%%}"
	fi
}

add-zsh-hook precmd _term_title_precmd
add-zsh-hook preexec _term_title_preexec

# Tell the terminal about the current directory so that new tabs and split
# panes start there (OSC 7).
function _term_cwd() { print -rn -- $'\e]7;file://'${HOST}${${PWD//\%/%25}// /%20}$'\a' }
add-zsh-hook chpwd _term_cwd
_term_cwd
