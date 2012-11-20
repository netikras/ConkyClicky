#!/bin/bash


cd ../
cp -arf ConkyClicky/. ~/.ConkyClicky

USERNAME=`whoami`
sed -i "s/my_username/${USERNAME}/g" ~/.ConkyClicky/cclicky.sh

echo DONE.
