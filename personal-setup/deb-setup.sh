#!/usr/bin/env bash

source ~/scripts/setup/hub.sh
git config --global user.name "Akhil Narang"
git config --global user.email "akhilnarang.1999@gmail.com"
git config --global credential.helper "cache --timeout=7200"
printf '\n' | tee -a ~/.bashrc
echo "source ~/scripts/functions" >> ~/.bashrc
echo "onLogin" >> ~/.bashrc
apt install figlet fortune byobu mosh -y
