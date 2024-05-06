if ! type zoxide &> /dev/null; then
	# Download and install zoxide
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh > /dev/null
fi

_evalcache zoxide init zsh
