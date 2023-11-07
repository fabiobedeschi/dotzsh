if type broot &> /dev/null; then
	br () {
		local cmd cmd_file code
		cmd_file=$(mktemp) 
		if broot --outcmd "$cmd_file" "$@"
		then
			cmd=$(<"$cmd_file") 
			rm -i -f "$cmd_file"
			eval "$cmd"
		else
			code=$? 
			rm -i -f "$cmd_file"
			return "$code"
		fi
	}
fi
