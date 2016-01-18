#!/bin/bash

set -e

red='\033[0;31m'
white='\033[0;37m'
blue='\033[0;34m'
green='\033[0;32m'
bold='\033[1m'
restore_color='\033[0m\033[22m'

if [ -x ~/.bash_profile ]; then
  echo -e "${red}${bold}[ERROR]:${restore_color} .bash_profile already exists"
  echo -e "${red}${bold}[ERROR]:${restore_color} You should merge files by hand."
else
  ln -s ./.bash_profile ~/.bash_profile
  echo -e "${green}${bold}[OK]:${restore_color} .bash_profile has linked"
fi

if [ -x ~/.tmux.conf ]; then
  echo -e "${red}${bold}[ERROR]:${restore_color} .tmux.conf already exists"
  echo -e "${red}${bold}[ERROR]:${restore_color} You should merge files by hand."    
else
  ln -s ./.tmux.conf ~/.tmux.conf
  echo -e "${green}${bold}[OK]:${restore_color} .tmux.conf has linked"
fi
