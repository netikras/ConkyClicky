#!/bin/bash

if [ `whoami` = root ]; then
    echo Please do not run this script as root or using sudo. Aborting...
    exit
fi


sudo apt-get install xdotool #xwininfo

cd ../
cp -arf ConkyClicky/. ~/.ConkyClicky

USERNAME=`whoami`
sed -i "s/my_username/${USERNAME}/g" ~/.ConkyClicky/cclicky.sh

echo DONE.
