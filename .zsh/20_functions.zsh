# Automatic ls after cd-ing into a directory
function _cdls() {
	emulate -L zsh
	$aliases[ls]
}
# chpwd_functions=( _cdls ${chpwd_functions[@]} )

# Prettify the output of "echo $PATH"
function ppath() {
	local _div='\n'
	if [ ! -z "$1" ]; then
		_div="$1"
	fi
	echo $PATH | sed "s/:/$_div/g"
}

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# '...' => '../..' and so on...
function rationalise-dot() {
    local MATCH
    if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]]; then
        LBUFFER+=/
        zle self-insert
        zle self-insert
    else
        zle self-insert
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert 2>/dev/null

# Get current lan ip address
function lanip () {
	for interface in $(ipconfig getiflist)
	do
		local ifaddr=$(ipconfig getifaddr ${interface})
		if [[ -n $ifaddr ]]
		then
			echo "${interface}:\t${ifaddr}"
		fi
	done
}

# Random password generation function
function genpasswd {
  	local l=16 # default password lenght
  	if [ "$#" != "0" -a "$1" -gt 0 ]
  	then
    	l=$1
  	fi
  	LC_ALL=C tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
alias genpw=genpasswd

# uuid v4 generation
function uuid_usage {
	echo "Print a random generated UUID v4."
    echo ""
    echo "Usage:"
    echo "\tuuid [option]"
    echo "Options:"
	echo "\t-h    --help     \tShow this help message."
    echo "\t-l    --lowercase\t$(uuid -l) (default)"
    echo "\t-u    --uppercase\t$(uuid -u)"
    echo "\t      --no-dashes\t$(uuid --no-dashes)"
    echo ""
}
function uuid {
	local gen_uuid=${$(uuidgen):l}
	while [ "$1" != "" ]; do
	    PARAM=`echo $1 | awk -F= '{print $1}'`
	    case $PARAM in
	        -h | --help)
	            uuid_usage
	            local error='true'
	            ;;
	        -u | --uppercase)
	            gen_uuid=${gen_uuid:u}
	            ;;
	        -l | --lowercase)
				gen_uuid=${gen_uuid:l}
	            ;;
	        --no-dashes)
				gen_uuid=$(echo $gen_uuid | tr -d '-')
	            ;;
	        *)
	            echo "ERROR: unknown parameter \"$PARAM\""
	            echo ""
	            local error='true'
	            uuid_usage
	            ;;
	    esac
	    shift
	done

	if [[ -z $error ]]; then
		echo $gen_uuid
	fi
}

# General purpose map function
function map {
	cmd="$1"; shift
	for arg in $@
	do
		$cmd $arg
	done
}

# Rename file to <basename>.bak
function bak {
	function _add_bak {
		if [[ "$(basename $1)" != *.bak ]]; then
			new_name="$(dirname $1)/$(basename $1).bak"
			mv "$1" "$new_name" && echo "$1\t-->\t$new_name"
		fi
	}

	function _rm_bak {
		if [[ "$(basename $1)" == *.bak ]]; then
			new_name="$(dirname $1)/$(basename $1 .bak)"
			mv "$1" "$new_name" && echo "$1\t-->\t$new_name"
		fi
	}
	local _rm_flags=(-r --rm --remove -R)

	if (( ${_rm_flags[(I)$1]} )); then
		shift
		map _rm_bak $@
	else
		map _add_bak $@
	fi
}

# Hide file prepending a dot
function dotf {
	function _hide {
		if [[ "$(basename $1)" != .* ]]; then
			new_name="$(dirname $1)/.$(basename $1)"
			mv "$1" "$new_name" && echo "$1\t-->\t$new_name"
		fi
	}

	function _show {
		if [[ "$(basename $1)" == .* ]]; then
			new_name="$(dirname $1)/${$(basename $1):1}"
			mv "$1" "$new_name" && echo "$1\t-->\t$new_name"
		fi
	}
	local _rm_flags=(-r --rm --remove -R)

	if (( ${_rm_flags[(I)$1]} )); then
		shift
		map _show $@
	else
		map _hide $@
	fi
}

# merge ${@:2} pdf files in $1 single pdf
function cpdf {
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$1" "${@:2}"
}

# Print all colors
function allcolors {
	for i in {0..255}; do
		print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
	done
}

# control mobymac
function mobymac {
	case $1 in
		'start')
			vboxmanage startvm mobymac --type headless
			;;
		'stop')
			vboxmanage controlvm mobymac poweroff
			;;
		'status')
			if [[ $(vboxmanage showvminfo "mobymac" | grep -c "running (since") != 1 ]]
			then
				echo 'Mobymac is not running. Use "mobymac start" to run the VM.'
			fi
			;;
		*)
			echo "Control mobymac virtualbox vm."
		    echo ""
		    echo "Usage:"
		    echo "\tmobymac <start|stop>"
		    echo ""
		    ;;
	esac
}

# general update function
function upd {
	if type apt &> /dev/null; then
		if type nala &> /dev/null; then
			echo "[upd] Updating apt (using nala)..."
			sudo nala upgrade
		else
			echo "[upd] Updating apt..."
			sudo apt update && sudo apt upgrade
		fi
		echo
	fi

	if type pacman &> /dev/null; then
		if type paru &> /dev/null; then
			echo "[upd] Updating pacman (using paru)..."
			paru -Syu
		elif type yay &> /dev/null; then
			echo "[upd] Updating pacman (using yay)..."
			yay -Syu
		else
			echo "[upd] Updating pacman..."
			sudo pacman -Syu
		fi
		echo
	fi

	if type dnf &> /dev/null; then
		echo "[upd] Updating dnf..."
		sudo dnf update
		echo
	elif type yum &> /dev/null; then
		echo "[upd] Updating yum..."
		sudo yum update
		echo
	fi

	if type brew &> /dev/null; then
		echo "[upd] Updating brew..."
		brew update && brew upgrade && brew cleanup
		echo
	fi

	if type flatpak &> /dev/null; then
		echo "[upd] Updating flatpak..."
		flatpak update
		echo
	fi

	if type snap &> /dev/null; then
		echo "[upd] Updating snap..."
		sudo snap refresh
		echo
	fi

	if type update_zsh &> /dev/null; then
		echo "[upd] Updating zsh..."
		update_zsh
		echo
	fi

	echo "[upd] Done!"
}
