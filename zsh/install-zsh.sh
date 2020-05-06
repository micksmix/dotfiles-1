# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

# change shell
chsh -s $(which zsh)

# plugins and theme
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
#git clone https://github.com/oskarkrawczyk/honukai-iterm-zsh.git $HOME/.oh-my-zsh/custom/themes/honukai
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions

# link zshrc file
ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
rm -rf $HOME/.oh-my-zsh/themes/honukai.zsh-theme
rm -rf $HOME/.oh-my-zsh/themes/powerlevel9k.zsh-theme
cp $HOME/dotfiles/init/honukai.zsh-theme $HOME/.oh-my-zsh/themes/honukai.zsh-theme
cp $HOME/dotfiles/init/powerlevel9k.zsh-theme $HOME/.oh-my-zsh/themes/powerlevel9k.zsh-theme