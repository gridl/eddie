#! /bin/bash

set -x


BOARD_TAG=mega
BOARD_SUB=atmega2560

USER='pi'
HOST='192.168.0.188'
FILE=$1

PROJECT_DIR=$HOME'/projects/arduino/deploy'

rsync -raz --progress ~/projects/invento/mitra-arduino $USER@$HOST:~/

    ssh $USER@$HOST 'mkdir -p $PROJECT_DIR'
    ssh $USER@$HOST 'platformio init --board megaatmega2560 -d ~/projects/arduino'
    scp $FILE $USER@$HOST:~/projects/arduino/deploy/src/deploy.ino
    ssh $USER@$HOST 'sudo pkill screen'
    ssh $USER@$HOST 'sudo platformio run --target upload -d ~/projects/arduino'
else
    mkdir -p $PROJECT_DIR
    platformio init --board megaatmega2560 -d $PROJECT_DIR
    cp $FILE $HOME'/projects/arduino/deploy/src/'
    sudo pkill screen
    sudo platformio run --target upload -d $PROJECT_DIR
fi


# ssh $USER@$HOST 'sudo ~/projects/vendor/arduino/arduino --port /dev/ttyACM* --board arduino:avr:mega --upload /tmp/motor.ino'
