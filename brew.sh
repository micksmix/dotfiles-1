#!/usr/bin/env bash

# Install command-line tools using Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew install bash
brew install bash-completion2
# zsh
brew install zsh
# set zsh as default
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install tmux
# brew install php
brew install gmp
brew install git
brew install git-lfs
brew install svn

# Install fonts
# brew tap caskroom/fonts
brew tap homebrew/cask-fonts
brew tap homebrew/homebrew-cask-fonts/
### font-hack
# brew cask fonts
echo_warn "Installing fonts..."
brew install --cask font-fira-code \
  font-fira-mono \
  font-fira-mono-for-powerline \
  font-fira-sans
brew install --cask font-anonymous-pro
brew install --cask font-dejavu-sans-mono-for-powerline
brew install --cask font-droid-sans
brew install --cask font-droid-sans-mono-for-powerline
brew install --cask font-inconsolata font-inconsolata-for-powerline
brew install --cask font-source-code-pro font-source-code-pro-for-powerline
brew install --cask font-source-sans-pro
brew install --cask font-ubuntu font-ubuntu-mono-powerline


# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install binwalk
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install xpdf
brew install xz

# Install other useful binaries.
brew install the_silver_searcher
brew install imagemagick
brew install jq
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install eg-examples
brew install bat
brew install --cask filemon

# misc
brew install --cask itsycal
brew install trash
brew install curl
brew install --cask iterm2
brew install htop
brew install wifi-password
brew install jabba
brew install --cask vlc
brew install --cask appcleaner

# dev stuff
brew install go
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask google-chrome

# Remove outdated versions from the cellar.
brew cleanup
