#!/usr/bin/env bash
# Terminal


shell_scripting() {}


# fail on error
set -e

# fail on unset variables
set -u


# prints each command in a script to stderr before running it
# trace all commands
set -x


# hash table
declare -A foo=(
    ["chrome"]="google-chrome"
    ["emacs"]="/usr/bin/emacs"
)


# exapnsion
echo {a..z}



# for loop
for i in {1..5}; do echo "Welcome $i times"; done

## declare an array variable
declare -a arr=("element1" "element2" "element3")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done




# if cond
if (( 2 > 0 ))
then
    echo 'right';
else
    echo 'wrong';
fi

if [ ! -f ~/.oh-my-zsh/README.md ]; then
    echo 'no file';
fi


# substring
$score=9.5
echo ${score:0:1}


if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo 'linux machine'
fi




while true; do ls; sleep 1; done


# environment variable
MyVar="${DEPLOY_ENV:-default_value}"


# arguments




# show history in zsh
fc -li -100000


# alias

alias  # show all alias
alias ls='ls -a'





# cron
 +---------------- minute (0 - 59)
 |  +------------- hour (0 - 23)
 |  |  +---------- day of month (1 - 31)
 |  |  |  +------- month (1 - 12)
 |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
 |  |  |  |  |
 *  *  *  *  *  command to be executed

 0 16 * * 5

# run job every minute
*/1 * * * * foo

# check cron log
grep CRON /var/log/syslog

# timings

# every minute
*/1 * * * * echo "job every minute"


# twice a day at 6, 18 hrs
* 6,18 * * * echo "foo"











# strace
strace -f -o /tmp/strace python t.py




# xargs


# on mac
ls | xargs -I {} ls {}
ls | xargs -I {} ls {}

# ignore empty
ls | xargs -I {} cat {} -r












# disks

# list block devices
lsblk
lsblk -o NAME,FSTYPE,UUID

# list drives
sudo lshw -class disk -short

# show file system
df
# show file system type
df -T

# show human readable summary of disk usage
du -hs

# size of folder
du -hs /var/lib/mysql/


# mount new hdd
sudo fdisk /dev/sd*
# n -> primary -> number 1 -> w
sudo mkfs -t ext4 /dev/sdb1
sudo mount /dev/sd* </some/path/>

# https://help.ubuntu.com/community/InstallingANewHardDrive


# mount ntfs external hdd
sudo apt-get install ntfs-3g
sudo ntfsfix /dev/sdXX


# nfs
# nfs install package
sudo apt-get install nfs-kernel-server nfs-common
# mount
sudo mount -o soft,intr,rsize=8192,wsize=8192 <ip>:/nfs /path/to/mount


# auto mount ext partitions

lsblk -o NAME,FSTYPE,UUID

# /etc/fastab
UUID=foo /media/chillar/foo/ ext4 defaults 0 0


# find firmware version
# login to device
cat /etc/version

# https://help.ubuntu.com/community/SettingUpNFSHowTo









# files


# sort by date/time
ls -t
ls -rt  # reverse

# replacing spaces in the file names with _
rename "s/ /_/g" * -n  # dry run
rename "s/ /_/g" *

# remove prefix
rename -v 's/a//' *

# add prefix
rename -v 's/^/pre/' *

# Lowercase all *.JPG filenames:
prename tr/A-Z/a-z/ *.JPG


# delete all directories but not files in pwd
rm -r */

# number of columns with delimiter ;
awk -F';' '{print NF; exit}' foo.txt
head -1 foo.txt | tr ';' '\n' | wc -l


# csv
awk -F"," '{print $1}' data.txt
cut -d, -f1 data.txt

# print 100th line
tail -n+100 <file> | head -n1
sed '100q;d' <file>

# find and replace text in files recursively
find /home/anand -name \*.py -exec sed -i "s/foo/bar/g" {} \;

sed -i "s/django==.*/django==${version}/" requirements.txt
sed -i '/pypi/c\"--extra-index-url https://blah.com/foo/bar/"' requirements.txt


# show foo.txt without last line
head -n -1 foo.txt

# line which is max length in file
wc -L file

# diff of files
diff <file1> <file2>



# awk
ls -l | awk '{ print $5  }'
ls -l | awk '{ print $2, '\t', $1  }'
awk 'BEGIN { print "Last \t Job"  } { print $2, '\t', $4  }'
cat test.txt | awk '{print NR, NF, $0 }'
ls -l | awk '{ if ( NF >= 9  ) { print $9  }  }'


# pick all nth lines from file
awk 'NR%2==0' infile > outfile



# print line 5 from file
sed -n 5p file
# print 5 to 10 lines
sed -n '5,10p' file
# delete last line of file
sed -i '$ d' foo.txt
# delete from foo to bar in 1 and store in 2
sed '/foo/,/bar/d' 1 > 2

# find & replace in file
sed -i 's/original/new/g' file.txt
sed 's/[A-Za-z]/ /g' -i tewiki.txt


# generate 1mb random file
base64 /dev/urandom | head -c 10000000 > random4.txt

# generate random password
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16


# split file
split -b 1024 big_file small_file_prefix
split -l 1000 big_file small_file_prefix


# show files in tree format
tree
tree -Cfhpu

# run bash as sudo to append file
sudo bash -c "cat in_file >> append_file"
cat in_file | sudo tee -a append_file

# generate etags - emacs
find . -name '*.py' -exec etags -a {} \;


# delete files matching pattern
find . -type d -name 'tests' | xargs rm -rf




# increase inotify watches limit

# temp
echo 16384 > /proc/sys/fs/inotify/max_user_watches
# permanent, add this to /etc/sysctl.conf
fs.inotify.max_user_watches=16384

sysctl -w net.core.somaxconn=4096

echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances


# allow linux to bind a nonlocal ip

# permanent, add this to /etc/sysctl.conf
net.ipv4.ip_nonlocal_bind = 1

sysctl -p /etc/sysctl.conf




# firewall

# show firewall status
sudo ufw status verbose

# enable/disable
sudo ufw enable
sudo ufw disable

# allow/deny ports
sudo ufw allow <port no>
sudo ufw deny <port no>
sudo ufw delete <port no>

sudo ufw logging [on/off]








ffmpeg() {}

# install
sudo apt install -y ffmpeg

# extract audio from video
ffmpeg -i foo.mp4 adandada.mp3
ffmpeg -acodec copy audio.mp3 -i vokoscreen-2018-04-13_17-29-33.mkv
ffmpeg -acodec libmp3lame audio.mp3 -i vokoscreen-2018-04-13_17-29-33.mkv


# merge audio video
ffmpeg -i video.mp4 -i audio.wav -c copy output.mkv

# convert one format to another

# convert m3u files to mp4
ffmpeg -i foo.m3u8 -c copy -bsf:a aac_adtstoasc output.mp4


# split video of 25 seconds
ffmpeg -i input.mkv -ss 00:01:10 -t 25 output.mkv

# trim audio/video
ffmpeg -i file.mkv -ss 00:00:20 -to 00:00:40 -c copy file-2.mkv

# transcode live rtmp to live rtmp
ffmpeg -i rtmp://server/live/originalStream -c:a copy -c:v libx264 -vpre slow -f flv rtmp://server/live/h264Stream

# capture webcam
ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 w.mkv
ffmpeg -f v4l2 -r 25 -s 640x480 -i /dev/video0 w.mkv -y
ffmpeg -f v4l2 -r 30 -s 320x240 -i /dev/video0 -y f.mkv
ffmpeg -f v4l2 -r 60 -s 1440x1080 -i /dev/video0 -y f.mkv


# capture audio
ffmpeg -f alsa -ac 2 -ar 44100 -i hw:0 out.wav -y
ffmpeg -f alsa -ac 2 -ar 256 -i hw:0 -y f.wav


# capture both
ffmpeg  -f v4l2 -r 25 -s 320x240 -i /dev/video0   -f alsa -ac 2 -ar 22050  -i hw:0 f.mkv -y

ffmpeg \
    -thread_queue_size 8192 -f v4l2 -s 320x240 -i /dev/video0 \
    -force_key_frames 00:00:00.000 -thread_queue_size 8192 -f alsa -ac 2 -ar 256 -i hw:0 \
    f.mkv -y

ffmpeg \
    -thread_queue_size 8192 -f alsa -ac 2 -i hw:0,0 -f v4l2 -i /dev/video0 -r 25 \
    -b:a 128k -pix_fmt yuv420p -vcodec libx264 -strict -2 \
    -y f.mp4







# ftp


# download sftp file
wget --user='user' --password='password' ftp://foo.com/bar

ftp <ip>
ftp> open <ip>
ftp> put <source> <target>
ftp> put test.png
ftp> cd /foo/bar/
ftp> put test.png


# ftp server

# install
sudo apt-get install vsftpd -y
# update config
sudo vim /etc/vsftpd.conf








git () {}

# update git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --yes git

# configuration
git config --list
git config --list --global

git config --global user.name "username"
git config --local user.email "your.email@gmail.com"

git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor vim
git config --global push.default=current


# store git credentials
git config credential.helper store


# squash last n commits
git reset --soft HEAD~n
git commit -m "Commit message"

# remove untracked files
git clean -fnd
git clean -fd

# unstage all staged changes
git reset

# discard unstaged changes
git checkout -- .


# to commit only one file
git commit -m 'my message' path/to/file.ext
# commit a part of file
git commit --patch <file_name>

# generate a git patch for a specific commit
git format-patch -1 <sha>
git format-patch -1 HEAD

# apply patch
patch -p1 < file.patch

# We don't support Python 2, in the best interest of future generations.

# show all remotes
git remote -v

# create branch from remote
git branch tasks origin/tasks

git checkout -b new-branch existing-branch


# fetch all remotes
git fetch origin '+refs/heads/*:refs/remotes/origin/*'

# fetch as another user
git pull https://myusername@github.com/projectfolder/projectname.git master
git fetch https://myusername@github.com/projectfolder/projectname.git master

# create gitlab remote
curl -u 'chillaranand' https://api.gitlab.com/user/repos -d '{"name":"foo"}'

# delete remote branch
git push origin :master


# checkout github pull requests locally
# add this to .git/config -> remote -> fetch
    fetch = +refs/pull/*/head:refs/remotes/origin/pr/*

git fetch origin


# push
git push master origin
git push -f master origin


# stash
git stash
git stash list
git stash apply <stash_num>
git stash pop


# alias
lg1 = log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all

# create a new branch
git checkout --orphan <branchname>
git rm --cached -r .


# reset to origin
git fetch origin
git reset --hard origin/master


# tags
git tag v1.0

git tag -l

git tag --delete tagname

git push --delete origin tagname
git push origin :tagname




# logs

# log stdout stderr to file
command >> log_file 2>&1
command >> log_file 2>> err_file

# check system log messages
sudo cat /var/log/syslog
# check error messages
sudo cat /var/log/dmesg










networking() {}


# show ip, mac address
ifconfig

# show other linux in lan
avahi-browse -tl _workstation._tcp
avahi-browse -attr


# get hostname
hostname

# set hostname
hostnamectl set-hostname localhost


# show ip, mac of all devices in network
sudo apt-get install arp-scan
sudo arp-scan -I wlan0 -l
sudo arp-scan --interface=eth0 --localnet
sudo arp-scan --interface=wlan0 --localnet | grep 192 | sort -V


# check port 8000
sudo netstat -peant | grep ":8000 "
lsof -i :8000


# what ports are open on any machine
sudo apt-get install --yes nmap
nmap 192.168.1.33
nmap localhost

# local machine
sudo netstat -tulpn
sudo netstat -tulpn | grep LISTEN

# dns queries
nslookup avilpage.com
nslookup -querytype=mx bbc.co.uk
dig avilpage




# connect to wifi from cli

# show available wifi networks
nmcli dev wifi

# create new connection to a wifi
nmcli dev wifi connect 'foo bar' password 'baz'

# create a new connection to a wifi and name it
nmcli dev wifi connect 'foo bar' password 'baz' name 'wifi1'

# connect to previous network
nmcli con up id 'wifi_name'

# create hotspot
nmcli device wifi hotspot con-name fubar ssid fubar band bg password fubar123

# connected networks are available in
/etc/NetworkManager/system-connections




# iptables
iptables -A INPUT -s 58.218.199.250 -j DROP

sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F INPUT
sudo iptables -F OUTPUT
sudo iptables -F FORWARD



# capture packets
sudo ettercap -i wlp1s0 -Tq -w data2.pkt




ssh()
# ssh using keys
ssh-keygen -t rsa

# get public key from private key
ssh-keygen -y -f ~/.ssh/id_rsa

# set permissions
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa

chmod 600 ~/.ssh/authorized_keys

# add keys to agent
ssh-add
ssh-add -l
ssh-add ~/.ssh/id_rsa

# copy key to server
cat .ssh/id_rsa.pub | ssh user@host 'cat >> .ssh/authorized_keys'
ssh-copy-id user@host


ssh user@host
ssh user@host -p 2222



# copy files
rsync -raz --progress user@host:/path/to/dir /path/to/target
rsync -raz --progress user@host:/path/to/dir /path/to/target --exclude=foo/bar


# show status of wireless devices
rfkill list


# kill process running on a port 12345
fuser -k 12345/tcp







# packages

# show info of packages
apt-cache show indicator-kdeconnect

# upgrade a single package
sudo apt-get install --only-upgrade <package name>

# show available versions of a package
sudo apt-cache policy <package name>
sudo apt-cache show <package name> | grep Version
sudo apt-cache madison <package name>

# remove ppa
sudo add-apt-repository --remove ppa:whatever/ppa
















# processes


# run a job in background
emacs &

# don't show output
emacs > /dev/null

# suppress error messages
emacs 2&>1 >/dev/null


# list all jobs with PID
jobs -l

# switch jobs from background to foreground
fg
fg %2

bg

# detach a process from terminal
disown


# ignore SIGHUP signal sent by terminal
nohup

# list all process
ps -ef

# kill process by id
kill -9 <PID>
kill -KILL <PID>
kill -SIGKILL <PID

# kill bg jobs
kill %{1..10}


# kill processes by name
pkill emacs

# kill process by some identifier
ps -ef | grep 'celery' | awk '{print $2}' | xargs kill -9
pgrep celery | xargs kill -9

pgrep -u tecmint top


# show all kill signals
kill -l


# run this command with lowest priority
nice -n 19 command














security()
# security

# enable automatic security updates
sudo apt-get install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades


# anti virus
sudo apt-get install clamav
# update virus database
sudo freshclam
# scan dir & list infected files
sudo clamscan -r -i /home


# root kit checker
sudo apt-get install -y rkhunter

# rkhunter check & report warnings only
sudo rkhunter -c --rwo

sudo apt-get install -y chkrootkit
chkrootkit





ssl()

# generate csr for ssl
openssl req -new -newkey rsa:2048 -nodes -keyout foo.com.key -out foo.com.csr

# get cn from ssl
openssl x509 -noout -subject -in fullchain.pem

# get expire date
openssl x509 -noout -endate -in file.pem


# reinstall for openssl
sudo apt-get install --reinstall ca-certificates
sudo update-ca-certificates


# certbot
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx

# generate ssl
sudo certbot --nginx -d avilpage.com certsonly

# wild card ssl
sudo certbot certonly --manual -d '*.meshedu.com' --agree-tos --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory


# generate ssl from web
https://www.sslforfree.com/


# scan http server for secret files
pip3 install snallygaster

snallygaster avilpage.com -d






# system info


# print distribution specific info
lsb_release -a

# display number of cores in a CPU
nproc
cat /proc/cpuinfo | grep processor | wc -l  # show no. of cpu


# get full cmd
cat /proc/212/cmdline/


# display amount of used/free memory in system (ram)
free -h

# show cpu architecture
lscpu

# list all pci connections
lspci
lspci -v

# show graphic card details
lspci | grep VGA

# show specific slot details
lspci -v -s 00:02.0

# all hardware memory info
sudo lshw -C memory

# maximum ram supported & available slots
sudo dmidecode -t memory
sudo dmidecode -t 16

# change brightness
echo 100 > /sys/class/backlight/foo/brightness





services()

# SysV
ls /etc/init.d

sudo update-rc.d rabbitmq-server disable


journalctl -u nginx.service
journalctl -u nginx
journalctl -u nginx -n 100
journalctl -u nginx -f

journalctl /usr/bin/bash


datetime() {}

# show date time
date

date -d "today" +"%Y-%m-%d-%H-%M-%S"

# set time/date
sudo date --set "25 Sep 2013 15:00:00"  # set date


# systemd uses timedatectl
timedatectl status
timedatectl list-timezones
sudo timedatectl set-timezone Asia/Kolkata

# set timezone
sudo dpkg-reconfigure tzdata  # set timezone







# usb pen drive


# parted
s parted -l


# list block devices
lsblk

# write permissions for a pendrive
dosfsck -a /dev/sdb1

# write permissions for pen drive
sudo mount -o remount,rw /media/foo/usb-drive

# bootable usb
# write to that device
sudo dd if=ubuntu-14.04-desktop-amd64.iso of=/dev/sdb bs=4M
sudo dd if=ubuntu-14.04-desktop-amd64.iso of=/dev/sdb


# format usb pendrive
lsblk
sudo umount /dev/sdb1
sudo umount /dev/sdb2
sudo fdisk /dev/sdb
o -> n -> w
sudo mkfs.vfat /dev/sdb1
sudo mkfs.vfat -n 'name_for_your_pendrive' -I /dev/sdb1
s mkntfs -Q -v -F -L "BALU" /dev/sdb1
sudo eject /dev/sdb

# usb write permissions
df -Th
unmout /media/
dosfsck -a /dev/sdb1




# grep


# grep for matching lines
grep 'foo' bar.txt
# grep for non matching lines
grep -v 'foo' bar.txt

# grep with context
grep -C 10 'foo' bar.txt
grep -A 5 -B 5 'foo' bar.txt

# search for string in all files
grep --recursive --files-with-matches 'foo' /path
grep -rl "foo" /path/to/dir/

# grep ps without grep
ps -ef | grep '[c]elery'



sudo service <name> start/stop/status/restart








users () {}

# create new user
sudo adduser <user>
sudo usermod -d /home/<user> <user>
sudo usermod -s /sbin/nologin <user>


# add user to sudo
sudo adduser <username> sudo

# remove username from sudoers list
sudo deluser <username> sudo

# show all sudo users
grep -Po '^sudo.+:\K.*$' /etc/group

# change user password
sudo passwd <username>

# change admin passwd
# recovery mode -> root ->
mount -rw -o remount /
sudo passwd <user>

# remove password prompt for a user
sudo visudo
# add this at the *end*
<username> ALL=(ALL) NOPASSWD: ALL

# show who is logged on and what they are doing
w






#### zip


# compress
bzip2 file
zip file.zip <file>
zip -r file.zip <path>
gzip file

# keep original file
gzip < s2.fq > s2.fq.gz


#decompress
bunzip2 file.bz2

# zsh
x <any zipped file>



# third party packages
















aws() {}
# aws cli

# install
pip install awscli

# configure
aws configure
aws configure list
aws configure --profile=new



# s3
aws s3 ls

# minio
aws s3 ls --endpoint-url http://0.0.0.0:9000

# buckets
aws s3 mb s3://bucket-name
aws s3 rb s3://bucket-name
# delete non-empty bucket
aws s3 rb s3://bucket-name --force

aws s3 cp s3://foo/bar ./aws/sherlock-test
aws s3 sync s3://foo s3://bar
aws s3 sync s3://foo ./aws/foo

# get bucket size
aws s3 ls --summarize --human-readable --recursive s3://bucket

# count objects
aws s3api list-objects --bucket BUCKETNAME --output json --query "[length(Contents[])]"

# make a bucket public
# add policy to bucket
{
  "Version": "2008-10-17",
  "Statement": [{
    "Sid": "AllowPublicRead",
    "Effect": "Allow",
    "Principal": { "AWS": "*" },
    "Action": ["s3:GetObject"],
    "Resource": ["arn:aws:s3:::my_bucket/*" ]
  }]
}




#ec2
aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, State.Name]'
aws ec2 run-instances --image-id ami-e13739f6 --count 1 --instance-type t2.nano
aed --output table --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, State.Name, PublicDnsName, PublicIpAddress]'
apm ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, State.Name, PublicDnsName, PublicIpAddress]' --region us-east-1







# byobu


# help
S + F1

# create new window
F2

F3/M + Left    - Move to previous window
F4/M + Right   - Move to next window
C + F2 - Split the screen vetically
S + F2 - Split the screen horizontally
S + F3 - Move to previous split screen
S + F4 - Move to next split screen
S + Arrows - To move along splits








docker () {}

# docker non root
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo usermod -a -G docker $USER

sudo chown $USER ~/.docker -R
newgrp docker
docker run hello-world


docker images

# show running containers
docker ps

# show all containers
docker ps -a

# list only container ids
docker ps -aq


docker commit <name>
docker start <id>
docker stop <id>

docker attach <id>
docker build

# build docker from current directory file
docker build .


docker run ubuntu
# detach
docker run -d ubuntu
dk run mkam/vulnerable-api-demo
docker run -it ubuntu
docker run -ditp 8001:8001 <image>

docker inspect <id>
docker history <image>
docker search <image name>


docker pull
docker pull ubuntu

# pull latest version
docker pull jocatalin/kubernetes-bootcamp

# pull specified version
docker pull jocatalin/kubernetes-bootcamp:v1



# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)


# docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose; sudo chmod +x /usr/local/bin/docker-compose

# suppress warning: no swap limit support
sudoedit /etc/default/grub
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
sudo update-grub && shutdown -r 0









nginx() {}

# http basic auth
sudo apt install --yes apache2-utils

sudo htpasswd -c /etc/nginx/conf.d/.htpasswd user1


# apache
apachectl configtest
apachectl stop
apachectl start


```apacheconf
server {

        listen 8002;

        # deny illegal host headers
        if ($host !~* ^(foo.com|www.foo.com)$ ) {
              return 444;
        }

        proxy_set_header Host $http_host;
        server_name foo.com;

        # force https redirection
        return 301 https://$server_name$request_uri;

        location  /static {
                include       /etc/nginx/mime.types;
                autoindex on;
                alias /opt/foo/collect_static;
        }

        location  /media {
                include       /etc/nginx/mime.types;
                autoindex on;
                alias /opt/foo/media;
        }

        location / {
                proxy_pass http://0.0.0.0:8001;
        }
}
```


# Basic auth
sudo htpasswd -c /etc/nginx/conf.d/.htpasswd user


### notedown

# https://github.com/aaren/notedown
pip install notedown

# convert markdown to ipython notebook
notedown python.md > python.ipynb

# convert ipython notebook to python script
jupyter nbconvert --to script 'my-notebook.ipynb'


















rabbitmqa() {}
sudo apt-get install rabbitmq-server


# rabbitmqctl
sudo rabbitmqctl list_users

sudo rabbitmqctl add_user <user> <pass>

# delete guest user
sudo rabbitmqctl add_user <user> <pass>


sudo rabbitmqctl list_vhosts
sudo rabbitmqctl add_vhost <my_host>

sudo rabbitmqctl set_permissions -p <vir_host> <user> ".*" ".*" ".*"

sudo rabbitmqctl list_queues
sudo rabbitmqctl list_exchanges

sudo rabbitmqctl stop_app
sudo rabbitmqctl reset
sudo rabbitmqctl start_app

# purge a queue
sudo rabbitmqctl purge_queue <queue_name>

# purge all queues
rabbitmqctl stop_app
rabbitmqctl reset    # Be sure you really want to do this!
rabbitmqctl start_app


# rabbitmq-plugins
sudo rabbitmq-plugins list
sudo rabbitmq-plugins enable rabbitmq_management

rabbitmqadmin -f tsv -q list queues name | while read queue; do rabbitmqadmin -q delete queue name=${queue}; done








redis() {}

# start server
redis-server

# allow remote connections
# comment `bind` option in `/etc/redis/redis.conf`

# ping redis
redis-cli ping

# shutdown
redis-cli shutdown

# show all keys
redis-cli --scan --pattern '*'


# show channels
pubsub channels


# subscribe to all channesl
redis-cli psubscribe '*'

redis-cli publish channel-foo message-bar



# interactive redis
redis-cli


SELECT 0
KEYS *
TYPE key

# Removes data from your connection's CURRENT database.
FLUSHDB
# removes data from ALL databases.
FLUSHALL

# sets
SADD foo bar
SMEMBERS foo

# strings
SET mykey myvalue
GET mykey

# list
LRANGE list 0 -1



# browsers
sudo apt-get install ruby-dev
sudo gem install redis-browser

sudo npm install -g redis-commander











# salt stack

# install
sudo apt-get --yes -q install python-software-properties

# states
sudo salt '*' state.apply <state1>
sudo salt '*' state.apply <state2> saltenv=<env1> --state-output=mixed
sudo salt '*' state.highstate saltenv=<env1>
sudo salt <minion1> state.highstate saltenv=<env2>

# jobs
# Return the data on all running salt processes on the minion
sudo salt '*' saltutil.running
sudo salt-run jobs.active
# find a running job with jid
sudo salt '*' saltutil.find_job <jid>
# kill a running job with jid
sudo salt '*' saltutil.kill_job <jid>





### screen

```shell
screen      # enter to screen
C + a ?     # display help
CTRL + a c  # create new window
C + a k     # kill current window
C + a w     # list all windows
C + a 0 -9  # switch windows
C + a C + a # toggle windows
```





### terminator

```shell
ctrl + shift + o - split screen horizontally
ctrl + shift + e - split screen vertically
ctrl + tab       - cycle through tabs
```


### tmux

```shell
ctrl + b % - split vertically
ctrl + b " - split window horizontally
ctrl + b arrow keys - switch panes
ctrl + b c - create new window in existing session

# list window layout
tmux list-windows
```


### xbacklight

```shell
# install x backlight
sudo apt-get install xbacklight

# xbacklighthelp
xbacklight -help

# set backlight brighness to 10
xbacklight -set 10
```


### xsel

# copy between files & clipboard
xsel -b < foo.txt
cat foo.txt | xclip -i

xsel -b > bar.txt

# share file
pastebinit foo.txt






curl(){}

# curl post with form data
curl http://192.168.0.152:8000/api/token/new.json -d "username=chillaranand&password=foo"
curl https://api.gitlab.com/user/repos -d '{"name":"foo"}' -u 'chillaranand'
curl -X POST http://localhost:8000/bots/ -d 'name=ff'


# check cors headers
curl -H "Origin: http://test.com/" -X OPTIONS -v http://bar.com

curl -X OPTIONS -v http://cdn.acme.com/icons.woff \
 -H "Origin: http://foo.com/" \
 -H "Access-Control-Request-Method: POST" \
 -H "Access-Control-Request-Headers: X-Requested-With" \

curl https://avilpage.com/upload/  -F "file=@/tmp/t"



httpie() {}

# httpie post with form data
http POST 0.0.0.0:8000/api/token/new.json username=f password=f -f

# raw body
http POST 0.0.0.0:8000/api/token/new.json username=f password=f -f

# httpie post json
http -a $USER:$GITHUB_TOKEN POST 'https://api.github.com/user/repos' name=foobar21

# httpie headers
http httpbin.org/user-agent  User-Agent:Bacon/1.0
http :8000/user-agent  User-Agent:Bacon/1.0

http httpbin.org/etag/foo If-None-Match:foo

# basic auth
http  'https://api.foo.com/bar' -a 'Basic foobartoken'
http  -a user:pass 'https://api.foo.com/bar'











heroku() {}

heroku login

# create new app
heroku create
heroku apps:create app-name


# add remote to existing app
heroku git:remote -a app_name

# show all env variables
heroku config

# set env
heroku config:set DEBUG_COLLECTSTATIC=1


# deployment - python web
# Procfile

# set buildpack
heroku buildpacks:set heroku/python

# set runtime

# set requirements
# set config
# set port

git push heroku master


# deployment docker
heroku plugins:install heroku-container-tools

heroku container:login

heroku container:push web






# screen recorder
kazam


# screenkey

# screenkey shows the keys pressed while screencasting
sudo apt-get install screenkey

# need to stop it from system-monitor



# jobs & priority
# change priority of jobs
renice -20(priority) 7448(jobid)





# tools monitor, bottleneck, performance, troubleshoot

atop


mpstat
dstat


sudo apt-get install stress


# generate load cpu
stress --cpu 4 --timeout 90
stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s


# io load
stress --io 222
sudo dd if=/dev/sda of=/dev/null


# meme load
stress --vm 2 --vm-bytes 1280M


sudo apt install sysstat
# sudo vim /etc/default/sysstat
# ENABLED="true"
sudo service sysstat restart

sar

# load average
sar -q

# individual cpu usage
sar -P 1 10
sar -P 2 10


vmstat -s
vmstat -m | head -5
vmstat -f


htop

ionice -c 3 command-name


# io usage
sudo iotop
sudo iotop -d 4


bmw-ng -i disk

iostat -xmt 1





# create new user

sudo useradd <username>
sudo passwd <username>
sudo adduser <username> sudo






# pypi

# upload package to pypi - distutils
python setup.py register -r pypi
python setup.py sdist upload -r pypi


# upload package to pypi - twine
python setup.py sdist bdist_wheel



# bumpversion
bumpversion --new-version 0.1.3



# pip

# install from github
pip install https://github.com/chillaranand/fadapa/archive/master.zip
pip install git+https://github.com/chillaranand/fadapa

# dev install
pip install -e /package/path

# install scipy
# sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran
# pip install scipy



# simple http server

# python 2
python -m SimpleHTTPServer

# python 3
python3 -m http.server

# twistd
twistd -n web --path .





# mitmproxy
sudo apt-get install python-pyasn1 python-flask python-urwid python-dev libxml2-dev libxslt-dev libffi-dev
sudo pip install mitmproxy
mitmproxy



















adb() {}

adb devices
adb install test.apk

# restart adb as root
adb root

# reboot into fastboot mode
adb reboot bootloader

# in adb shell
mount -o rw,remount,rw /system
mount system RO: mount -o ro,remount,ro /system

# list all packages
adb shell "pm list packages -f"
adb shell "pm uninstall com.foo.bar"

# start app
adb shell am start -n com.foo.bar

# start ap
adb shell am broadcast -a com.whereismywifeserver.intent.TEST --es sms_body "test from adb"


# dumpysys
adb shell dumpsys activity broadcasts



# adb pull
adb pull /storage/emulated/0/Pictures/Screenshots/ .
adb pull /storage/emulated/0/DCIM/Camera/ .

android_rooting() {}


# unlock bootloader

# enable developer options
# enable OEM unlock

# go to fastboot
fastboot devices
fastboot oem get_unlock_data

# use that and get key from vendor
# https://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-b

# after getting key from vendor
fastboot oem unlock D2Z6X73ZVAG4X2FSHMNQ

# reboot


# custom recovery

# download twrp by device codename
adb reboot bootloader
sudo fastboot flash recovery twrp-otus-3.0.2-r1.img
sudo fastboot boot oneplus3/twrp-3.2.1-0-oneplus3.img

sudo fastboot reboot




# root with supersu

# install custom recovery

# download supersu and install it
adb push UPDATE-SuperSU-v2.02.zip /sdcard/UPDATE-SuperSU-v2.02.zip
# go to recovery -> install -> select supersu -> install -> reboot





# recover from bootloop

# boot to recovery mode
# advanced -> enable sideload
adb sideload UPDATE-SuperSU-v2.46.zip








# cyanogenmod


# wipe
dalvik cache,data, cache,system

# push rom
adb push -p cm-14.0-20160910-UNOFFICIAL-athene.zip /sdcard/

# download and install gapps
adb push open_gapps-arm-7.1-nano-20161217.zip /sdcard/
# reboot recovery - install zip




# factory reset with fastboot
fastboot erase system
fastboot erase userdata
fastboot erase cache




# xposed


# download xposed zip and flash
wget http://dl-xda.xposed.info/modules/de.robv.android.xposed.installer_v33_36570c.apk
adb sideload de.robv.android.xposed.installer_v32_de4f0d.apk

# download xposed apk and install it

# decompile apk
apktool d foo.apk
apktool d foo.apk -f
java -jar apktool_2.3.1.jar d foo.apk




android_termux() {}









# nikola

pip install nikola

nikola plugin -i import_blogger
nikola import_blogger ~/Downloads/blog-07-23-2016.xml


nikola bootswatch_theme -s cosmos
nikola theme -i base-jinja

nikola auto
nikola serve




celery()

celery -A tasks worker -l info

# kill all celery workers
ps -ef | grep 'celery' | awk '{print $2}' | xargs kill -9

pgrep celery | xargs kill -9

celery inspect active
# https://gist.github.com/amatellanes/a986f6babb9cf8556e36



# flower
flower
flower --app t
flower --app t --address=0.0.0.0 --port=8888
flower --version






# gsetting

# disable auto-opening nautilus window after auto-mount
gsettings set org.gnome.desktop.media-handling automount-open false


















vagrant()

vagrant init
vagrant init ubuntu/xenial64
vagrant init debian/jessie64

vagrant up
vagrant up --provider=Virtualbox
v provision

vagrant ssh
vagrant ssh-config

vagrant reload

vagrant destroy

vagrant status
vagrant halt

vagrant global-status








ansible() {}

ansible -i hosts all --list-hosts

ansible all -i 192.168.0.47, -m ping -vvvv --user root
ansible all -i inventory/vagrant.ini -m ping
ansible all -m ping -vvvv --user root -e 'ansible_python_interpreter=/data/data/org.qpython.qpy/files/bin/qpython-android5.sh' -i 192.168.0.16,

ansible all -i inventory/vagrant.ini -m yum -a "name=ntp state=present" --sudo
ansible all -i vagrant.ini -m shell -a "pwd"

# show facts
ansible all -i scripts/inventory.ini -m setup


ansible-playbook -i inventory/vagrant.ini ntpd-init.yml
ansible-playbook playbook.yml -i inventory.ini --user=username --extra-vars "ansible_sudo_pass=yourPassword"

# override variables from cli
ansible-playbook example.yml -e token=12345

ansible-playbook --list-tasks mezzanine.yml


# profiling
# add this line to ansible.cfg
callback_whitelist = profile_tasks





ios () {}

i libimobiledevice-utils

# restart ios device
idevicediagnostics restart


idevice_id -l
ideviceinstaller -l
ideviceinfo --domain com.apple.mobile.battery




# tesseract
tesseract in.jpg out.txt -l tel




# hg

# remove files
hg purge
hg st -un0 | xargs -0 rm

# stash
hg shelve

# to enable add this to .hgrc
[extensions]
purge =




# pandoc
pandoc -o test.html test.md
pandoc --toc --highlight-style pygments -o f.pdf celery.md --listings -H header.tex
pandoc --toc --highlight-style pygments -o f.pdf celery.md -V papersize:a5 -V fontsize=12pt
pandoc -o f.pdf celery.md --highlight-style pygments
pandoc -f markdown -t epub --epub-cover-image=cover.jpg -o final.epub --smart --toc --epub-stylesheet=epub.css inputfile.txt










# images

# stack images horizontally
convert +append *.png out.png

# stack images vertically
convert -append *.png out.png

# format conversion
convert foo.png foo.jpg


# split pdf to png
convert -density 300 input.pdf -quality 90 prefix

# png to pdf
convert *.png foo.pdf


convert myfigure.png -resize 200x100 myfigure.jpg
convert -resize 50% myfigure.png myfigure.jpg

# don't keep image aspect ratio
mogrify -resize 320x240! file.png


pdftoppm -rx 300 -ry 300 -png a.pdf prefix

# pdf compress

# good quality
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=out.pdf book.pdf

# low quality
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=out.pdf book.pdf

ps2pdf in.pdf out.pdf

convert -density 300x300 -quality 60 -compress jpeg in.pdf out.pdf

# pdf2go - 52











gcloud() {}
# google cloud platform - gcloud

# install ubuntu
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk


# auth
gcloud auth application-default login

gcloud projects list


gcloud config set project avilpage-staging

gcloud config set compute/zone us-central1-a


gcloud container clusters list

# fetch data and generate kubectl entry
gcloud container clusters get-credentials "cluster-foo"


gcloud compute addresses list


gcloud compute instances list

# ssh into instance
gcloud compute ssh "server-foo"

# open a port
gcloud compute firewall-rules create <rule-name> --allow tcp:9090 --source-tags=<list-of-your-instances-names> --source-ranges=0.0.0.0/0 --description="<your-description-here>"


# iot
gcloud pubsub subscriptions pull --auto-ack projects/livnse/subscriptions/livnsensenew








kubectl () {}


kubectl proxy


# show merged kubeconfig settings - all clusters
kubectl config view

# set cluster
kubectl config use-context local
kubectl config use-context staging

kubectl config current-context


# get cluster info
kubectl cluster-info


# delete namespace and all components
kubectl delete namespace deis


# describe
kubectl describe

kubectl describe pods name
kubectl describe po name


# edit controller config
kubectl edit deployment/deis-controller -n deis


# run command in pod
kubectl exec $POD_NAME env

# interactive terminal
kubectl exec -ti $POD_NAME bash
kubectl exec $POD_NAME --namespace=$NAMESPACE -it bash


kubectl get nodes

kubectl get pods --all-namespaces
kubectl get pods -o wide
kubectl get pods --namespace=deis

kubectl get services


kubectl logs pod_name
kubectl logs pod_name -n namespace


kubectl patch deployment deis-controller -n deis -p '{"spec":{"containers":{"env":[{"name":"TZ","value":"Asia/Kolkata"}]}}}'

kubectl patch deployment deis-controller -n deis -p '{"spec":{"containers":{"env":[{"name":"DEIS_DEPLOY_HOOK_URLS","value":"foo"}]}}}'






minikube () {}
# setup kubernetes locally

minikube version

minikube start
minikube start --disk-size=60g --memory=4096

minikube status

minikube stop

minikube delete


minikube addons enable registry-creds







helm () {}

helm init

helm version

helm ls --all

helm repo add deis https://charts.deis.com/workflow
helm repo update

helm install deis/workflow --namespace deis --set router.host_port.enabled=true
helm install deis/workflow --namespace $NAMESPACE_DEIS --name $NAMESPACE_DEIS -f deis-workflow.yaml

helm delete deis --purge





deis () {}

# install helm client and run helm init to start server
helm init
helm repo add deis https://charts.deis.com/workflow
helm install deis/workflow --namespace deis --set router.host_port.enabled=true


deis -v
deis version -a


deis register http://deis.example.com
deis login http://deis.example.com

deis whoami


# add keys
deis keys:add
deis keys:list


# adding john to system administrators
deis perms:create john --admin
deis perms:list --admin

deis apps

deis logs
deis logs -a sherlock

deis ps

deis info

deis releases
deis releases:info v9








kops() {}
export KOPS_STATE_STORE=s3://kube.avilpage.com
export NAME=kube.avilpage.com
kops export kubecfg kube.avilpage.com






# watchdog

# restart celery workers
watchmedo shell-command --patterns="*.py;*.html" --recursive --command='pgrep celery | xargs kill -9 && celery worker -A t'




gpg()

gpg --gen-key

gpg --list-secret-keys --keyid-format LONG

gpg --armor --export 3AA5C34371567BD2

git config --global gpg.program gpg2




# install pip
https://bootstrap.pypa.io/get-pip.py | python





# restrict parent
wget -m -I bar1/bar2 -X "*" http://www.foo.com/bar1/bar2/bar3/index.html






postgres() {}


# install
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

# uninstall
sudo apt-get --purge remove postgresql postgresql-doc postgresql-common


# config
# /var/lib/pgsql/9.4/data/postgresql.conf
listen_addresses = '*'


# /var/lib/pgsql/9.4/
host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5


# restart
sudo service postgresql restart


psql --version

# for password less login
sudo psql -u user_name db_name

# change to "postgres" Linux user
sudo su - postgres

# connect to remote db
psql -h $DB_HOST -U $DB_USER -w


# create user
createuser foo

# db
createdb db_name

# drop database
dropdb db_name


# list databases
psql -l

# run queries from cli
psql -c 'ALTER USER chillar WITH SUPERUSER;'

psql -c '\c testdb;'
psql << EOF
SELECT * FROM xyz_table;
SELECT * FROM abc_table;
EOF
psql -c 'alter user kuser with createdb'





# backup
pg_dump database_name > db.sql

# compressed binary format
pg_dump -Fc db_name > db.bak

# tarball
pg_dump -Ft db_name > db.tar


# restore from plain text
cat db.sql | psql db_name
psql -d db_name -f db.sql


# dump file
pg_restore -d dummy_db -1 backup-2018-05-23.dump -v

# restore from compressed files
pg_restore -Fc database.bak
pg_restore -Ft database.tar

# create db & restore
pg_restore -Fc -C database.bak





load_test()


# postgres
pgbench -i -s 50 load_test_db

pgbench -c 10 -j 2 -t 10000 load_test




# websocket load test

npm install -g loadtest thor artillery

artillery()
artillery quick --count 10 --num 10 -o t.json wss://echo.websocket.org


thor -C 200 -A 800 wss://foo.com/bar/1/



# apache bench - load test
ab -c 100 -n 100 https://avilpage.com/api/courses/1/
ab -c 100 -n 400 -T 'application/x-www-form-urlencoded; charset=UTF-8' -H "Accept-Encoding: gzip, deflate" -p scripts/signup.txt https://avilpage.com/api/signup/




mysql() {}

# post install
sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld


# reset root password
sudo mysqld_safe --skip-grant-tables --skip-networking
mysql -u root


# backup & restore
mysqldump -u root -p database > database.sql
mysqldump -u root -p database < database.sql

mysqldump -u root -p database table > table.sql







node() {}

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm ls-remote

nvm install node
nvm install --lts


# update node
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo ln -sf /usr/local/n/versions/node/<VERSION>/bin/node /usr/bin/node






# embedded systems

# connect to device via serial port
sudo minicom -s

# boot menu
U-Boot>
md 0x4006E000 1
mw 0x4006E000 0x1000



# devices

# mouse
sudo cat /dev/input/mice


# character serial devices
ls -ll /dev/input/mice
crw-rw---- 1 root input 13, 63 Jul 15 07:32 /dev/input/mice


# block devices
l /dev/sr0
brw-rw----+ 1 root cdrom 11, 0 Jul 15 07:32 /dev/sr0


stty -F /dev/ttyUSB0 115200


# i2c
apt install i2c-tools

i2cdetect -y 1
i2cdetect -y 0




# gpio

# reserve a pin
echo 65 > /sys/class/gpio/export

echo out > /sys/class/gpio/gpio65/direction

echo 1 > /sys/class/gpio/gpio65/value




arduino() {}




platformio () {}
sudo pip install platformio


# list available devices
pio device list

platformio init --board megaatmega2560 -d ~/nav
sudo platformio run --target upload

platformio ci --board=megaatmega2560 --project-option="targets=upload" bled/bled.ino
platformio ci --board=megaatmega2560 --project-option="upload_port=/dev/ttyACM0" --project-option="targets=upload" bled/bled.ino
platformio ci --board=megaatmega2560 --project-option="lib_deps=LedControl" --project-option="targets=upload" nav/nav.ino




bluetooth()

# control
bluetoothctl


# scan for available bluetooth devices
hcitool scan


# send files to device
bluetooth-sendto

# receive files
gnome-file-share-properties


# android to ubuntu bluetooth
# use port > 1. Ubuntu already uses port 1 for something else. For port 3 enter:
sudo rfcomm listen /dev/rfcomm0 3

# connect with the app to port 3
sudo cutecom
sudo screen /dev/rfcomm0

# show paired devices
bt-device -l



# java

# find JAVA_HOME
jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));'




python-django()
django()
# python - django

./manage.py changepassword admin
./manage.py createsuperuser


# Reset south migrations - delete ghost migrations
rm <app-dir>/migrations/*
dj schemamigration <app-name> --initial
dj migrate <app-name> 0001 --fake  --delete-ghost-migrations

# Check for any errors in the construction of your models
dj validate


# reset sql sequence
dj sqlsequencereset app_name

# Introspects the database tables and outputs a Django models
dj inspectdb

# Prints the SQL statements for resetting sequences for the given app
dj sqlsequencereset users



dj test --keepdb


# django-extensions
dj reset_db -c --noinput
dj show_urls
dj show_urls | column -t

# pytest
pytest --collect-only




# drf - django-rest-framework

# get auth token
dj drf_create_token -r <username>
curl -X POST http://localhost:8000/api-token-auth/ -d 'username=foo&password=bar'

curl http://localhost:8000/foo/ -H 'Authorization: Token bar'




uwsgi() {}
uwsgi --http 0.0.0.0:8000 --wsgi-file config/wsgi.py

uwsgi --http 0.0.0.0:8000 --wsgi-file avilpage/wsgi.py --threads 2 --process 4 --max-worker-lifetime 30 --logto /tmp/uwsgi.log --enable-threads

uwsgi --http :8890 --file rse.py --gevent 2000 -l 1000 -p 1 -L




gunicorn() {}

# run gunicorn & log to terminal
gunicorn library.wsgi -c g.py --log-file=-
gunicorn library.wsgi --log-file=- --log-level debug -w 9
DJANGO_SETTINGS_MODULE=project.settings.prod gunicorn project.wsgi --bind 0.0.0.0:8008 --log-level debug --log-file=- --preload


# hug
gunicorn textsearch:__hug_wsgi__



daphne() {}



uvicorn() {}
uvicorn foo.asgi --workers 4 --log-level debug




# flask
export FLASK_APP=foo.py
flask run --host=0.0.0.0




# python
python()


python -m cProfile -s time foo.py


python -m timeit "2*3"


python -m trace --listfuncs foo.py


# run script
kernprof -l foo.py

# see results
python -m line_profiler foo.py.lprof





dotnet()


# install
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1.4


dotnet publish

# make migrations
dotnet ef migrations -v add "intial"

# migrate
dotnet ef -v database update

dotnet run





# dbus
qdbus
qdbus --system
qdbus --system org.freedesktop.NetworkManager




# translate

pip install translate

translate-cli -t te "This is a pen."



# 1. Set the OPENEDX_RELEASE variable:
export OPENEDX_RELEASE=release-2018-04-02-11.52
# 2. Bootstrap the Ansible installation:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/ansible-bootstrap.sh -O - | sudo bash
# 3. (Optional) If this is a new installation, randomize the passwords:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/generate-passwords.sh -O - | bash
# 4. Install Open edX:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/sandbox.sh -O - | bash



# expose ports to internet



# supervisor



logwatch()

logwatch --range "-10 days" --debug high


# set default shell
chsh -s $(which zsh)


# autopep8
autopep8

autopep8 --in-place --recursive .



mongodb()

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org



# stt-wavenet
git clone https://github.com/buriburisuri/speech-to-text-wavenet
sudo apt install -y libsndfile-dev ffmpeg


# wav2letter

# torch
git clone https://github.com/torch/distro.git torch --recursive
cd torch
# clean old torch installation
./clean.sh
TORCH_LUA_VERSION=LUA52 ./install.sh

./install/bin/luarocks install torch
./install/bin/luarocks install cunn


sudo apt-get install fftw-dev fftw3-dev


# python oneliners
python -c 'import crypt; print(crypt.crypt("secret", "pass"))'
python -c 'import uuid; print(str(uuid.uuid4())'



# wpa/wpa2 pen testing
sudo ifconfig wlp1s0 down
sudo iwconfig wlp1s0 mode monitor
sudo ifconfig wlp1s0 up

sudo iwconfig wlp1s0
sudo airodump-ng wlp1s0
sudo airmon-ng start wlp1s0


sudo airodump-ng -c 6 --bssid 98:DE:D0:FE:B2:56 -w snafu/ wlp1s0




# goaccess
wget http://tar.goaccess.io/goaccess-1.2.tar.gz
tar -xzvf goaccess-1.2.tar.gz
cd goaccess-1.2/

sudo apt-get install libncursesw5-dev libmaxminddb-dev libgeoip-dev

./configure --enable-utf8 --enable-geoip=legacy --with-openssl
make
make install


# multitail
mutlitail -c file.log



mac_book()

# show cpu info
sysctl -n machdep.cpu.brand_string


# aptible
aptible apps:scale --app appname web --container-size 1024
aptible db:tunnel --type management rabbitmq-handle



# elastic beanstalk
eb deploy library
eb deploy --label foo library
