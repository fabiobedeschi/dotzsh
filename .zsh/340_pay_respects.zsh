if type pay-respects &> /dev/null; then
	# --nocnf: .zshrc drops command_not_found_handler anyway.
	_evalcache pay-respects zsh --alias f --nocnf

	# pay-respects echoes the prompt back with its suggestion, rendering it with
	# `print -P "$PROMPT"`. Powerlevel10k's prompt cannot be expanded outside of
	# p10k, so that prints "bad substitution" on every invocation. The prefix is
	# cosmetic; drop it.
	if (( $+functions[__pr_base] )); then
		function __pr_base() {
			_PR_MODE="$1" _PR_PREFIX='' _PR_LAST_COMMAND="$2" _PR_ALIAS="$(alias)" _PR_SHELL=zsh pay-respects
		}
	fi
fi
