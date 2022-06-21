# Give precedence to some brew keg-only packages
if type brew &>/dev/null; then
	path=(
		$(brew --prefix libpq)/bin
		$(brew --prefix bzip2)/bin
		$(brew --prefix coreutils)/libexec/gnubin
		$(brew --prefix grep)/libexec/gnubin
		$(brew --prefix)/bin
		$path
	)

	fpath=(
		/usr/local/share/zsh/site-functions
		$fpath
	)
fi
