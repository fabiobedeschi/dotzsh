function sshot () {
	local _filename

	# If -f option is provided, use the specified filename
	if [[ "$1" == "-f" ]]; then
    shift
    _filename="$1"
  else
    # Default filename format
    _filename="$HOME/Pictures/Screenshots/$(date '+%Y-%m-%d_%H-%M-%S').png"
  fi

  # check for gnome-screenshot and satty presence, abort if one is not found
  if ! command -v gnome-screenshot &> /dev/null && ! command -v satty &> /dev/null; then
    echo "Error: Neither gnome-screenshot nor satty is installed."
    return 1
  fi

  gnome-screenshot -a -f "$_filename" && satty -f "$_filename" -o "$_filename"
}

# minimized version for keybinding
# sh -c 'f(){ if [ "$1" = "-f" ]; then shift; fn="$1"; else fn="$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"; fi; if ! command -v gnome-screenshot >/dev/null && ! command -v satty >/dev/null; then echo "Error: Neither gnome-screenshot nor satty is installed."; return 1; fi; gnome-screenshot -a -f "$fn" && satty -f "$fn" -o "$fn"; }; f "$@"'
