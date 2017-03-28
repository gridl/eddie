set -x

# deb http://download.virtualbox.org/virtualbox/debian stretch contrib
# curl -O https://www.virtualbox.org/download/oracle_vbox_2016.asc
# sudo apt-key add oracle_vbox_2016.asc
# sudo apt-get update
# sudo apt-get install virtualbox-5.1


# sudo apt-get install apt-transport-https ca-certificates software-properties-common
# curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
# sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ debian-$(lsb_release -cs) main"
# sudo apt-get update
# sudo apt-get -y install docker-engine


sudo apt-get install -y autoconf automake libtool
sudo apt-get install -y autoconf-archive
sudo apt-get install -y pkg-config
sudo apt-get install -y libpng12-dev
sudo apt-get install -y libjpeg8-dev
sudo apt-get install -y libtiff5-dev
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libicu-dev
sudo apt-get install -y libpango1.0-dev
sudo apt-get install -y libcairo2-dev
sudo apt-get install -y libleptonica-dev
