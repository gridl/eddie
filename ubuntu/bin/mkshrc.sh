# Copyright (c) 2010, 2012, 2013, 2014
#	Thorsten Glaser <tg@mirbsd.org>
# This file is provided under the same terms as mksh.
#-
# Minimal /system/etc/mkshrc for Android
#
# Support: https://launchpad.net/mksh

: ${HOSTNAME:=$(getprop ro.cm.device)}
: ${HOSTNAME:=$(getprop ro.product.device)}
: ${HOSTNAME:=android}
: ${TMPDIR:=/data/local/tmp}
export HOSTNAME TMPDIR

if (( USER_ID )); then PS1='$'; else PS1='#'; fi
PS4='[$EPOCHREALTIME] '; PS1='${|
        local e=$?

        (( e )) && REPLY+="$e|"

        return $e
}$HOSTNAME:${PWD:-?} '"$PS1 "

if [ "z$ANDROID_SOCKET_adbd" != "z" ]; then
   resize
fi

# export PATH=$PATH:/data/data/org.qpython.qpy/files/bin
export PATH=/data/data/com.termux/files/usr/bin:$PATH
export LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib
export HOME=/data/data/com.termux/files/home/

echo $PATH
echo $LD_LIBRARY_PATH

# alias python=qpython-android5.sh
# alias py=python



echo '@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo 'Supercharged shell started'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@'



alias sl='ssh -v localhost'
alias c=cat
alias rs='pkill sshd && sshd -p 22'

/bin/sh
