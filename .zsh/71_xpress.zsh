# Use FICO Xpress
if [ -z "$XPRESSDIR" -o ! -d "$XPRESSDIR" ]; then
  [[ -r "$HOME/bin/xpressmp/bin/xpvars.sh" ]] && source "$HOME/bin/xpressmp/bin/xpvars.sh"
fi
