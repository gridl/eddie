#! /bin/bash


exec 1> >(logger -s -t $(basename $0)) 2>&1



for i in {0..3};
do
    sar -P $i 1 &
    sleep 1
done
