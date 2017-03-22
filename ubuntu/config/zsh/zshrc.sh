# links
# ln ~/.custom_zsh/zshrc ~/.zshrc
# ln ~/.custom_zsh/themes/ys2.zsh-theme ~/.oh-my-zsh/themes/ys2.zsh-theme

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# best-themes-list - half-life, ys, steef, sorin, jonathan(line)
ZSH_THEME="ys2"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.01/ubuntu/config/zsh


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git z extract dirpersist autoenv web-search pip)
plugins=(git z extract dirpersist pip zsh-autosuggestions)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacsclient'
else
    export EDITOR='emacsclient'
    export EDITOR='vim '
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"







# user config

# set utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# source /etc/profile.d
if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi



# source virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
# source /etc/bash_completion.d/virtualenvwrapper






# Load pyenv automatically
# export PATH="/home/anand/.pyenv/bin:$PATH"




# emacs prelude
export TERM=xterm-256color

export PYTHONDONTWRITEBYTECODE=False

export THEANO_FLAGS='floatX=float32'

source $ZSH_CUSTOM/aliases.sh




### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.cask/bin:$PATH"

# all shell scripts
export PATH="$HOME/.os/bin:$PATH"



export NODEENV_HOME=$HOME/.nodeenvs

export NIKOLA_MONO=true

export PATH="/home/chillaranand/.cask/bin:$PATH"
export PATH="/home/chillaranand/Downloads/android-ndk-r12b-linux-x86_64/android-ndk-r12b:$PATH"



# secrets
source ~/Dropbox/tech/env.sh

if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

# pyenv
export PATH="/home/chillaranand/.pyenv/bin:$PATH"


# vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox


# remove duplicate history
# setopt EXTENDED_HISTORY
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_IGNORE_DUPS
# setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_IGNORE_SPACE
# setopt HIST_FIND_NO_DUPS
# setopt HIST_SAVE_NO_DUPS
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE


function search {
    grep -irl \
        --exclude=\*.{pyc,swp,un~,png,jpg} \
        --exclude-dir=".git" \
        --exclude-dir="node_modules" \
        --exclude-dir="bower_components" \
        --exclude-dir="dist" \
        --exclude-dir="tmp" \
        --exclude-dir=".sass_cache" \
        --exclude-dir="Appknox" \
        --exclude-dir="build" \
        --exclude-dir="uploads" \
        --color "$*" .
}

alias a=alias
alias al='alias | le'

alias j=z
alias jd='cd ~/Downloads/'
alias js='cd ~/sandbox'
alias jv='cd ~/Videos/'
alias j1='j 01'


alias b='byobu'
alias af='sudo apt-fast'
alias i='sudo apt-fast install --yes'
alias au='sudo apt-fast update -qq'


alias i='sudo apt-fast install --yes'
alias ag='sudo apt-get'
alias au='sudo apt-get update -qq'

alias cf='clementine -f'
alias ch='nohup google-chrome > /dev/null &'
alias cr='clementine -r'


alias de='sudo salt master state.highstate saltenv=web'

alias pgi='ps -ef | grep -i'


# python aliases
alias py='python'
alias ipy='ipython'
alias py2='python2'
alias ipy2='ipython2'

alias da='deactivate'
alias pf='pip freeze | sort'
alias pfl='pip freeze | sort | less'
alias pi='pip install'
alias spi='s pip install'
alias pie='pip install -e .'
alias piu='pip install --upgrade'
alias pu='pip uninstall --yes'
alias piup='pip install --upgrade pip'

alias pir='pip install -r'
alias pirr='pip install -r requirements.txt'
alias pire='pip install --upgrade jedi rope flake8 importmagic autopep8 yapf'
alias pird='pir ~/.01/ubuntu/config/requirements.txt'





alias psi='python setup.py install'

alias pt="pytest -vx --ff"
alias pti="pytest -vx --ff --ipdb"

alias nb='ipython notebook'
alias jn='jupyter notebook'
alias 1n='cd ~/.01/python; jupyter notebook python3.ipynb'

alias dj="python manage.py"
alias djc="python manage.py createsuperuser"
alias djcd="python manage.py createsuperuser --username f --email a@a.com"

alias dm="python manage.py migrate"
alias dmm="python manage.py makemigrations"
alias dmmm="dmm && dm"

alias dr="python manage.py runserver --no-color"
alias drp="python manage.py runserver_plus"

alias ds="python manage.py shell_plus --print-sql"
alias dsp="python manage.py shell_plus --print-sql"

alias dsu="python manage.py show_urls"
alias dsug="python manage.py show_urls | grep "

alias dn='python manage.py shell_plus --notebook'
alias dcm='python manage.py compilemessages && python manage.py makemessages'



alias du='du -hs'

alias e='ember '
alias es='ember server'
alias eg='ember generate '

alias e='nohup emacs >/dev/null &'
# alias f='flash '

# alias fk='fuck '
# eval "$(thefuck --alias)"


alias hs='history'
# alias hg='history | grep'
alias hgi='history | grep -i'
alias ht='htop'

alias p='ping 8.8.8.8'


alias jobs='jobs -l'

alias k='kill -9'
alias pk='pkill'
alias ka='killall '
alias ke='killall emacs'
alias kb="pgi byobu | awk '{print $2}' | xargs kill -9 "

alias l='clear && ls'

alias le=less




# git
alias lg1=log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
alias lg2=log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
alias lg="git lg1"


alias gcl="git clone"
alias cl="git clone"

alias gi="git init"

alias gf='git fetch'
alias gfo='git fetch origin'
alias fod='git fetch origin develop'
alias fodd='git fetch origin develop:develop'
alias fom='git fetch origin master'
alias fomm='git fetch origin master:master'

alias glu="git pull upstream"
alias glum="git pull upstream master"
alias lumm="git pull upstream master:master"

alias gsuo="git pull upstream master && git push origin master"
alias gsy="git pull upstream master && git push origin master"

alias gcom="git checkout master"
alias gcod="git checkout develop"

alias gla="git pull --all"
alias glum="git pull upstream master"
alias glod="git pull origin develop"
alias lodd="git pull origin develop:develop"
alias glom="git pull origin master"

alias gp="git push --set-upstream"
alias gpf="git push -f"

alias gpom="git push origin master"
alias pom="git push origin master"

alias gphm="git push heroku master"
alias phm="git push heroku master"
alias hm="git push heroku master"
alias hmf="git push heroku master -f"

alias gpp="git pull && git push"

alias gsw='git standup -d 7'
alias sw=gsw




alias m=mux
alias ml='mux list'

alias ma='mux avilpage'
alias mak='mux ak'
alias mj='mux junction'

alias tk='tmux kill-session -t '

alias kcw='ps -ef | grep 'celery worker' | awk '{print $2}' | xargs kill -9'
alias cia='celery inspect active'


# alias ma=man

alias me='chmod +x '

alias smo="ssh moriarty@devicefarm.appknox.com "

alias nt='nautilus .'

alias n='nikola'
alias na='nikola auto'
alias naf='rf output cache && rf cache && nikola auto'
alias ng='nikola github_deploy'
alias nn='nikola new_post'


alias re='sudo shutdown -r 0'
alias rf='rm -rf'




alias us='sudo ansible-playbook ~/.01/ubuntu/config/playbooks/setup.yml -i localhost, -c local'
# alias us='sudo ~/.01/ubuntu/bin/start.sh'


alias cs='~/.01/ubuntu/bin/space2ctrl.sh'

alias s=sudo
alias si='sudo -i'
alias sp='sudo du -hs *'

alias se='source .env'
alias sz='source ~/.zshrc'

alias sd='source ~/Dropbox/env'
alias db='~/.dropbox-dist/dropboxd'

alias sy='rsync -raz --progress'

alias t='tree -Cfh'
alias we='workon exp'
alias wi='whereis'
alias wo='workon'
alias wp='workon pearl'
alias yd='youtube-dl '

alias lh='http://127.0.0.1:8000'



# appknox cli
alias akh='appknox --help'

alias ak='appknox --username f --password f --host 127.0.0.1:8000 --no-secure'

alias aks='ak submit_url "https://play.google.com/store/apps/details?id=com.wFinalZen"'

alias akn='appknox --username g --password g --host 127.0.0.1:8000 --no-secure'

alias akp='appknox --username $AK_USER --password $AK_PASS '
alias akpv='appknox --username $AK_USER --password $AK_PASS validate '
alias akpu='appknox --username $AK_USER --password $AK_PASS upload ~/Downloads/apps/test_zen_stories.apk '


alias ct='crontab '





# adb
# alias ad='python /home/chillaranand/projects/appknox/python-adb/adb.zip '
# alias add='python /home/chillaranand/projects/appknox/python-adb/adb.zip devices'
# alias ad1='python /home/chillaranand/projects/appknox/python-adb/adb.zip -s T00940Z1AS'
# alias a1='python /home/chillaranand/projects/appknox/python-adb/adb.zip -s T00940Z1AS'
# alias a2='python /home/chillaranand/projects/appknox/python-adb/adb.zip -s T00940ZT2K'


alias ai='adb install '
alias ad='adb devices '
alias app='adb push -p '
alias arr='adb reboot recovery '
alias arb='adb reboot bootloader '


alias fb='sudo fastboot '
alias fd='sudo fastboot devices'




alias wifi='nmcli dev wifi '
wco () {
    nmcli dev wifi connect $1 password $2
}

alias ram="watch -n3 'sudo ps_mem | tail -n+2 | head -n-3 | tail -n10 | tac'"

alias v='vagrant '
alias vd='vagrant destroy -f'
alias vr='vagrant reload'
alias vs='vagrant ssh'
alias vsc='vagrant ssh-config'
alias vu='vagrant up'
alias vgs='vagrant global-status'



scs () {
    systemctl status $1.service
}

scr () {
    systemctl restart $1.service
}


# appknox
alias as='adb shell'

alias ci='curl ipinfo.io'
alias c='cat '
alias cc='pygmentize -g'
alias o='xdg-open '

alias ts='pirate-get '

alias banti='python /home/chillaranand/projects/python/ocr/banti_telugu_ocr/recognize.py'


function ne() {
    docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`";
};

alias enhance=ne

alias rs='./scripts/start_server.sh'
alias sss='./scripts/start_server.sh'
alias ssc='./scripts/start_celery.sh'
alias st='./scripts/test.sh'


ifs () {
    rm -rf test_build
    mkdir test_build
    ./configure --prefix=$(pwd)/test_build
    make
    make install
}


irene () {
    cd /home/chillaranand/projects/appknox/irene
    deactivate
    source ~/.nodeenvs/irene/bin/activate
    ember serve
}

mycroft () {
    cd /home/chillaranand/projects/appknox/mycroft/
    deactivate
    workon mycroft
    eval $(./scripts/env_converter.py)
}
alias my=mycroft


sherlock () {
    cd /home/chillaranand/projects/appknox/sherlock/
    deactivate
    workon sherlock
    eval $(./scripts/env_converter.py)
}
alias sl=sherlock

alias fl=flash

alias tv=tvol




alias rnm='sudo systemctl restart NetworkManager'

alias sub='subliminal download -s -l en '
alias subs='subliminal download -s -l en '


vagrant_kube () {
    export KUBERNETES_PROVIDER=vagrant
    export KUBERNETES_MASTER_MEMORY=1536
    export KUBERNETES_NODE_MEMORY=4096
}

pyclean () {
        find . -type f -name "*.py[co]" -delete
        find . -type d -name "__pycache__" -delete
}


alias sc='sudo systemctl '
alias rc='sudo rabbitmqctl '


alias kc='kubectl '

alias kcp='google-chrome http://127.0.0.1:8001/ui/ && kubectl proxy'

alias kcc='kubectl config'
alias kcv='kubectl config view'
alias kccv='kubectl config view'

alias kcg='kubectl get '

alias kcdd='kubectl delete deployments'

alias kcgd='kubectl get deployments --all-namespaces'

alias kcgn='kubectl get nodes'

alias kcgp='kubectl get pods --all-namespaces'



alias ae='aws ec2'
alias aed='aws ec2 describe-instances'
alias aei="aed --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, PublicDnsName, PublicIpAddress]'"
alias asl='aws s3 ls'



alias di='deis '

alias dl='deis logs'
alias dls='deis logs -a sherlock'

alias dp='deis ps'

alias dir='deis releases | tac'






# make aliases work with sudo
alias sudo='sudo '

alias mk='minikube '
alias mks='minikube start'


export KUBE_ENABLE_INSECURE_REGISTRY=true
export KUBERNETES_MASTER_MEMORY=1536
export KUBERNETES_NODE_MEMORY=4096
export KUBERNETES_PROVIDER=vagrant

export EDITOR=vim


alias h='http '
# alias hs='http --session=tmp/session.json '

alias wl='http :8000'


export TZ=Asia/Kolkata

alias ty=type

alias ap='sudo ansible-playbook'


dpkg_unlock() {
    sudo rm /var/lib/apt/lists/lock
    sudo rm /var/cache/apt/archives/lock
    sudo rm /var/lib/dpkg/lock
}

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/bin/java




alias he='heroku'
alias hc='heroku config'
alias hcs='heroku config:set'

alias hlw='heroku local web'


# workon py37d
workon py35


# autoenv
source /usr/local/bin/activate.sh
# direnv
# eval "$(direnv hook zsh)"

alias sr='sudo service'
alias f8='flake8'

alias pg='pirate-get'

reset_rabbit() {
    sudo rabbitmqctl stop_app
    sudo rabbitmqctl reset
    sudo rabbitmqctl start_app
}

alias p2='wo py27'
