#! /bin/sh


set -x

sudo apt update
sudo apt install --yes zsh byobu tree git

byobu-enable

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
