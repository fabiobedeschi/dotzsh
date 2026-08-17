# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.

# Powerlevel10k instant prompt. Must stay close to the top of ~/.zshrc.
if [[ -r ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh ]]; then
	source ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh
fi

# Shell options.
setopt always_to_end auto_cd auto_param_slash auto_pushd c_bases extended_glob
setopt interactive_comments multios no_auto_remove_slash no_beep no_bg_nice
setopt no_flow_control no_list_types glob_dots no_auto_menu

# History.
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt extended_history hist_expire_dups_first hist_ignore_dups hist_save_no_dups
setopt hist_find_no_dups hist_ignore_space hist_verify share_history hist_fcntl_lock

# Line editor.
bindkey -e                     # emacs keymap; modules add their own bindings
WORDCHARS=''                   # word == alphanumerics only
KEYTIMEOUT=20                  # wait 200ms for the rest of a key sequence
ZLE_REMOVE_SUFFIX_CHARS=''     # don't eat space when typing '|' after a completion
zle_highlight=('paste:none')   # don't highlight pasted text
POWERLEVEL9K_INSTANT_PROMPT=quiet

typeset -gaU cdpath fpath path manpath

# Homebrew environment, without paying for `brew shellenv`.
() {
	local brew
	if [[ $OSTYPE == darwin* ]]; then
		brew=({/opt/homebrew,/usr/local}/bin/brew(N))
	else
		brew=({/home/linuxbrew/.linuxbrew,~/.linuxbrew}/bin/brew(N))
	fi
	(( $#brew )) || return 0
	export HOMEBREW_PREFIX=${brew[1]:h:h}
	export HOMEBREW_CELLAR=$HOMEBREW_PREFIX/Cellar
	if [[ -e $HOMEBREW_PREFIX/Homebrew/Library ]]; then
		export HOMEBREW_REPOSITORY=$HOMEBREW_PREFIX/Homebrew
	else
		export HOMEBREW_REPOSITORY=$HOMEBREW_PREFIX
	fi
	path=($HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin $path)
}

# Extend PATH
path=(
	~/opt
	~/bin
	~/.local/bin
	/usr/local/bin
	/usr/local/sbin
	$path
)

# Extend FPATH
fpath=(~/.zsh/completions $fpath)

# Export environment variables.
export GPG_TTY=$TTY

# Plugin loader: clone from GitHub on first use, then source the entrypoint.
# Update everything with `update_zsh`.
typeset -g ZSH_PLUGIN_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/plugins
function plug() {
	local repo=$1 dir=$ZSH_PLUGIN_DIR/${1:t} file
	if [[ ! -d $dir ]]; then
		(( $+commands[git] )) || { print -ru2 "plug: git is required to install $repo"; return 1 }
		print -ru2 "plug: installing $repo"
		command git clone -q --depth=1 https://github.com/$repo.git $dir || return
	fi
	for file in ${2:+$dir/$2} $dir/${repo:t}.plugin.zsh $dir/${repo:t}.zsh $dir/${repo:t}.zsh-theme; do
		[[ -r $file ]] && { source $file; return }
	done
	print -ru2 "plug: no entrypoint found in $dir"
	return 1
}

# `compdef` is only defined once compinit has run, which happens late (see
# 900_completion.zsh) so that modules can still extend fpath. Queue the calls
# made before that point; 900_completion.zsh replays them.
typeset -ga _compdef_queue=()
function compdef() { _compdef_queue+=("${(j: :)${(q)@}}") }

# Autoload functions.
autoload -Uz add-zsh-hook zmv
autoload -Uz colors && colors

# Source the configuration modules. Load order is the numeric filename prefix;
# the glob requires an underscore in the name.
for _rc in $HOME/.zsh/*_*.zsh(N); do
	source $_rc
done
unset _rc

# Named directory: ~w <=> Windows home directory on WSL.
[[ ! -d /mnt/c/Users/$USER ]] || hash -d w=/mnt/c/Users/$USER

# Disable command not found
[[ ! -v functions[command_not_found_handler] ]] || unfunction command_not_found_handler

# Prompt. Type `p10k configure` or edit the config file to customize it.
plug romkatv/powerlevel10k
if (( ${terminfo[colors]:-0} >= 256 )); then
	source ~/.p10k.zsh
else
	source ~/.p10k-8color.zsh
fi
