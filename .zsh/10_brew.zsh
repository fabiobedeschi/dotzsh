# Give precedence to some brew keg-only packages
if type brew &>/dev/null; then
	path=(
#		$HOMEBREW_PREFIX/opt/libpq/bin
#		$HOMEBREW_PREFIX/opt/bzip2/bin
#		$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
#		$HOMEBREW_PREFIX/opt/grep/libexec/gnubin
#		$HOMEBREW_PREFIX/opt/make/libexec/gnubin
		$HOMEBREW_PREFIX/bin
		$path
	)

	fpath=(
		$HOMEBREW_PREFIX/share/zsh/site-functions
		$fpath
	)
fi
