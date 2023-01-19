if type 'docker-sync' &> /dev/null; then
	alias ds='docker-sync'
	alias dsupd='docker-sync start'
	alias dsstop='docker-sync stop'
	alias dsdn='docker-sync clean'
	alias dsls='docker-sync list'
	alias dsrestart='docker-sync restart'
	alias dss='docker-sync sync'
	alias dslog='docker-sync logs'
fi
