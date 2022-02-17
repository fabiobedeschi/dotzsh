# Give precedence to some brew keg-only packages
path=(
    $(brew --prefix libpq)/bin
	$(brew --prefix bzip2)/bin
	$path
)
