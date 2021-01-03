#!/bin/sh
source ./functions/common

brew tap homebrew/cask-fonts

# Install long list of packages.
IFS=$'\n'

print_line "Installing Homebrew packages."
for i in $(cat ./lists/brew-packages)
do
    brew install "$i"
done

print_line "Installing Homebrew cask packages."
for i in $(cat ./lists/brew-cask-packages)
do
    brew install --cask "$i"
done

#print_line "Installing App Store applications."
#cat ../lists/mas-app-ids | xargs mas install
