# dotfiles

## Installation

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln ./zsh/.zshrc ~/.zshrc
ln ./zsh/themes/oxide.zsh-theme ~/.oh-my-zsh/custom/themes/oxide.zsh-theme
for plugin in ./zsh/plugins/*
do
ln -s $(realpath $plugin) ~/.oh-my-zsh/custom/plugins/$(basename $plugin)
done
```
