# zsh configuration

My zsh configuration: plain zsh, no framework, plus a few upstream plugins cloned on first run.

- [powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt
- [fzf](https://github.com/junegunn/fzf) history search (`ctrl+r`), file picker (`ctrl+t`), directory picker (`alt+c`)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) for fzf-driven tab completion
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search), [zsh-completions](https://github.com/zsh-users/zsh-completions)

## Install

Assuming you have `git` installed on your system:

```sh
git clone https://github.com/fabiobedeschi/dotzsh.git $HOME/dotzsh
cd $HOME/dotzsh
chmod +x install update
./install
```

### Automatic install

Copy and paste the following command in your terminal, it will automatically clone the repository to `$HOME/dotzsh` and run the install script (requires `curl` or `wget` installed):

```sh
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/fabiobedeschi/dotzsh/master/auto_install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/fabiobedeschi/dotzsh/master/auto_install)"
fi
```

## Update

After the installation simply run:

```sh
update_zsh
```

This also updates the plugins, which live in `${XDG_CACHE_HOME:-~/.cache}/zsh/plugins`.

## Notes

- Coming from the previous [zsh4humans](https://github.com/romkatv/zsh4humans) setup? Nothing is left behind in
  `~/.zshenv`, so `rm -rf ~/.cache/zsh4humans` once the new shell works.
- `p10k configure` regenerates `~/.p10k.zsh`. The `-8color` variant is used on terminals with fewer than 256 colors.
- Keys: `shift+↑` cd up, `shift+←`/`shift+→` walk the directory stack, `shift+↓` or `alt+c` pick a subdirectory,
  `↑`/`↓` search history by what is already typed, `ctrl+z` undo, `alt+m` accept the whole suggestion.
