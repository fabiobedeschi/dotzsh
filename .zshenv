# Keep all shell customization in ~/.zshrc or in files sourced from it.
# This file is sourced by *every* zsh, including non-interactive scripts.

# Skip /etc/zprofile, /etc/zshrc and /etc/zlogin. On macOS /etc/zprofile runs
# path_helper, which reorders PATH and puts system tools ahead of ours.
setopt no_global_rcs
