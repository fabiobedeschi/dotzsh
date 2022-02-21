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
elif type batcat &>/dev/null; then
	alias bat=batcat
	export CAT='bat -p'
	export FZF_CAT='bat --color=always --style=numbers --line-range=:500 {}'
	export PAGER=$CAT
else
	export CAT='cat'
	export FZF_CAT='cat {}'
	export PAGER='less'
fi

export LESS='-FR --mouse'
export AWS_PAGER=$PAGER

# Color howdoi prompt
export HOWDOI_COLORIZE=1

# Stop powerlevel10k wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
