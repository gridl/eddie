if [ ! -f /usr/local/bin/deis ]; then
    curl -sSL http://deis.io/deis-cli/install-v2.sh | bash
    sudo mv $PWD/deis /usr/local/bin/deis
fi


if [ ! -f /usr/local/bin/helm ]; then
    curl -sSL https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
fi

if [ ! -f /usr/local/bin/minikube ]; then
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    sudo mv minikube /usr/local/bin/
fi


# - {name: 'pyenv', url: 'https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer'}
# - {name: 'deis',     url: 'http://deis.io/deis-cli/install-v2.sh'}
# - {name: 'minikube', url: 'https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-linux-amd64'}
# - {name: 'kubectl',  url: 'https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl'}
# - {name: 'node',  url: 'https://deb.nodesource.com/setup_7.x'}
# - {name: 'helm',  url: 'https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get'}
