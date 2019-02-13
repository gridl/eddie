#! /bin/sh

set -x


config_dir=${HOME}'/projects/eddie'

# terminal
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


rm ~/.zshrc
ln -s $config_dir'/cli/zshrc.sh' ~/.zshrc


# utils
brew install cowsay
brew install nmap


# adb
brew cask install android-platform-tools


# oh my zsh
# emacs

# set screenshots folder
defaults write com.apple.screencapture location ~/Pictures
