# Pokemon fortune
if type fortune &> /dev/null; then
	if type pokemonsay &> /dev/null; then
		fortune | pokemonsay -n -t
	fi
fi
