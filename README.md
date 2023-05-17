# zsh configuration

My zsh configuration based on the awesome [zsh 4 humans](https://github.com/romkatv/zsh4humans)

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

## Notes

- `z4h` keeps its update mechanism separated, use `z4h update` for updating it
