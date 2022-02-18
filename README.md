# zsh configuration

My zsh configuration based on the awesome [zsh 4 humans](https://github.com/romkatv/zsh4humans)

## Install

Assuming your current shell is `zsh`:

```zsh
git clone https://github.com/fabiobedeschi/dotzsh.git $HOME
cd $HOME/dotzsh
chmod +x install update
./install
```

### Automatic install (not tested)

```zsh
if command -v curl >/dev/null 2>&1; then
  zsh -c "$(curl -fsSL https://raw.githubusercontent.com/fabiobedeschi/dotzsh/master/auto_install)"
else
  zsh -c "$(wget -O- https://raw.githubusercontent.com/fabiobedeschi/dotzsh/master/auto_install)"
fi
```

## Update

After the installation simply run:

```zsh
update_zsh
```

## Notes

- `z4h` keep his update mechanism separated. Fot this run `z4h update`
