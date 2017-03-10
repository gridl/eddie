#! /bin/sh

sudo apt update --yes
sudo apt install --yes software-properties-common python python-pip

# required for cryptograhy
sudo apt install --yes libssl-dev
sudo -H pip install ansible

for file in setup.yml binary_install.yml script_install.yml git_clone.yml
do
    wget -c https://raw.githubusercontent.com/ChillarAnand/01/master/ubuntu/config/playbooks/$file -O /tmp/$file
done

sudo ansible-playbook /tmp/setup.yml -i localhost, --check --connection local
