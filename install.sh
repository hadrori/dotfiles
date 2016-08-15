#!/bin/bash

set -e

red='\033[0;31m'
white='\033[0;37m'
blue='\033[0;34m'
green='\033[0;32m'
bold='\033[1m'
restore_color='\033[0m\033[22m'

if [ -e ~/.bash_profile ]; then
  echo -e "${red}${bold}[ERROR]:${restore_color} .bash_profile already exists"
  echo -e "${red}${bold}[ERROR]:${restore_color} You should merge files by hand."
else
  ln -s ./.bash_profile ~/.bash_profile
  echo -e "${green}${bold}[OK]:${restore_color} .bash_profile has linked"
fi

if [ -e ~/.tmux.conf ]; then
  echo -e "${red}${bold}[ERROR]:${restore_color} .tmux.conf already exists"
  echo -e "${red}${bold}[ERROR]:${restore_color} You should merge files by hand."    
else
  ln -s $(echo $(pwd)/.tmux.conf) ~/.tmux.conf
  echo -e "${green}${bold}[OK]:${restore_color} .tmux.conf has linked"
fi

if [ -e ~/.zshrc ]; then
  echo -e "${red}${bold}[ERROR]:${restore_color} .zshrc already exists"
  echo -e "${red}${bold}[ERROR]:${restore_color} You should merge files by hand."    
else
  ln -s $(echo $(pwd)/.zshrc) ~/.zshrc
  echo -e "${green}${bold}[OK]:${restore_color} .zshrc has linked"
fi

if [ -e ~/.gitconfig ]; then
  echo -e "${red}${bold}[ERROR]:${restore_color} .gitconfig already exists"
  echo -e "${red}${bold}[ERROR]:${restore_color} You should merge files by hand."    
else
  ln -s $(echo $(pwd)/.gitconfig) ~/.gitconfig
  echo -e "${green}${bold}[OK]:${restore_color} .gitconfig has linked"
fi
