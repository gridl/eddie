#! /bin/bash

# set -x


declare -A processes=(
    ["chrome"]="google-chrome"
    ["emacs"]="emacs"
    ["xcape"]="xcape.sh"
    ["dropbox"]="dropboxd"
)


for process in "${!processes[@]}";
do
    pidof $process >/dev/null
    if [[ $? -ne 0 ]] ; then
        ${processes[$process]} &
    fi
done
