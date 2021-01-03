#!/bin/sh
source ../functions/common

print_line "Setting shell to zsh."
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

# Set brew-installed bash as default bash
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  #chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# set zsh as default
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
# install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh

# plugins and theme
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions

# link zshrc file
ln -sf "$HOME/dotfiles/zsh/zshrc" "$HOME/.zshrc"
rm -rf "$HOME/.oh-my-zsh/themes/honukai.zsh-theme"
rm -rf "$HOME/.oh-my-zsh/themes/powerlevel9k.zsh-theme"
ln -sf "$HOME/dotfiles/init/honukai.zsh-theme" "$HOME/.oh-my-zsh/themes/honukai.zsh-theme"
ln -sf "$HOME/dotfiles/init/powerlevel9k.zsh-theme" "$HOME/.oh-my-zsh/themes/powerlevel9k.zsh-theme"
# cp $HOME/dotfiles/init/honukai.zsh-theme $HOME/.oh-my-zsh/themes/honukai.zsh-theme
# cp $HOME/dotfiles/init/powerlevel9k.zsh-theme $HOME/.oh-my-zsh/themes/powerlevel9k.zsh-theme