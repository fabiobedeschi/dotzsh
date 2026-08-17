# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='micro'
fi

# Paginator
if type bat &>/dev/null; then
	export CAT='bat -p'
	export FZF_CAT='bat --color=always --style=numbers --line-range=:500 {}'
	export PAGER=$CAT
	export BAT_PAGER='less'
elif type batcat &>/dev/null; then
	alias bat=batcat
	export CAT='bat -p'
	export FZF_CAT='bat --color=always --style=numbers --line-range=:500 {}'
	export PAGER=$CAT
	export BAT_PAGER='less'
else
	export CAT='cat'
	export FZF_CAT='cat {}'
	export PAGER='less'
fi

# Enable java windows in sway
if [[ -n $SWAYSOCK ]]; then
	export _JAVA_AWT_WM_NONREPARENTING=1
fi

# add "--mouse" option if tmux is enabled
export LESS='-FR'
export AWS_PAGER=$PAGER

# Color howdoi prompt
export HOWDOI_COLORIZE=1

# LS_COLORS is used by GNU ls and zsh completions, LSCOLORS by BSD ls.
export LS_COLORS='fi=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:'
LS_COLORS+='pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32'
export LSCOLORS='ExGxDxDxCxDxDxFxFxexEx'
export TREE_COLORS=${LS_COLORS//04;}

# Stop powerlevel10k wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
