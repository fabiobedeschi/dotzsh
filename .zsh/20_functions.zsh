# Automatic ls after cd-ing into a directory
function cd() { builtin cd "$@" && ls }

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

# Rename file to <basename>.bak
function bak {
  	mv "$1" "$(dirname $1)/$(basename $1 .bak).bak"
}

# Hide file prepending a dot
function hide {
	mv "$1" "$(dirname $1)/.$(basename $1)"
}

# merge ${@:2} pdf files in $1 single pdf
function cpdf {
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$1" "${@:2}"
}

# Print all colors
function colors {
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
