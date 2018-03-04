#! /bin/sh

set -x


BASE_DIR=$HOME'/projects/eddie'
CONFIG_DIR=$BASE_DIR'/ubuntu/config'


sudo apt-get install --yes -qq git
cd
mkdir -p projects
git clone https://github.com/chillaranand/eddie projects/eddie || true


if [ ! -f ~/.oh-my-zsh/README.md ]; then
    sudo apt-get install --yes -qq zsh
    sudo apt-get install --yes -qq byobu
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone https://github.com/zsh-users/zsh-autosuggestions .zsh-autosuggestions || true
    rm ~/.zshrc
    ln -s $CONFIG_DIR'/zsh/zshrc.sh' ~/.zshrc
fi


if [ ! -f /usr/bin/google-chrome ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
    sudo apt-get install --yes -qq google-chrome-stable
    echo "chrome is installed"
fi


if [! -f /usr/local/bin/ansible ]; then
    sudo apt-get install --yes -qq software-properties-common python python-pip python3-pip
    sudo -H python3 -m pip install ansible -q
fi


sudo ansible-playbook $CONFIG_DIR'/playbooks/ubuntu.yml' -i localhost, --connection local
