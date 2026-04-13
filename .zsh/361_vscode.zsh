if type code &>/dev/null; then
	[[ $(uname) != 'Darwin' ]] && alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto" || true
fi
