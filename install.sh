#!/bin/bash

if [ `whoami` = root ]; then
    echo Please do not run this script as root or using sudo. Aborting...
    exit
fi


#sudo apt-get install xdotool #xwininfo #prie priklausomybių parašyk jog reikia to paketo, ta komanda vistiek veikia tik ant ubuntu.

cd ../
cp -arf ConkyClicky/. ~/.ConkyClicky

USERNAME=`whoami`
sed -i "s/my_username/${USERNAME}/g" ~/.ConkyClicky/cclicky.sh

echo ATLIKTA.
