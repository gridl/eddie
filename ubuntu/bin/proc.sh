#! /bin/bash

set -x


pidof chrome >/dev/null
if [[ $? -ne 0 ]] ; then
    echo "Starting chrome"
    google-chrome &
else
    echo 'chrome already started'
fi


pidof emacs >/dev/null
if [[ $? -ne 0 ]] ; then
    echo "Starting emacs"
    emacs &
else
    echo 'emacs already started'
fi


pidof xcape >/dev/null
if [[ $? -ne 0 ]] ; then
    echo "Starting xcape"
    space2ctrl.sh
else
    echo 'xcape is running'
fi
