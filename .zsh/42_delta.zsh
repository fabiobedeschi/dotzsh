if type delta &> /dev/null; then
	unalias diff
	alias diff=delta
	export GIT_PAGER=delta
fi
