# Give precedence to some brew keg-only packages
if type brew &>/dev/null; then
	path=(
		$(brew --prefix libpq)/bin
		$(brew --prefix bzip2)/bin
		$path
	)
fi
