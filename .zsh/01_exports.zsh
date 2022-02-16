# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='micro'
fi

# Paginator
if type bat &>/dev/null; then
	export CAT='bat -p'
elif type batcat &>/dev/null; then
	alias bat=batcat
	export CAT='bat -p'
else
	export CAT='cat'
fi

export PAGER='less'
export LESS='-FR'
export AWS_PAGER=$PAGER

# mobymac dockerhost
export DOCKER_HOST='tcp://192.168.56.2:2376'

# Color howdoi prompt
export HOWDOI_COLORIZE=1
