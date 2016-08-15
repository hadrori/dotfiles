#!/bin/bash

set -e

red='\033[0;31m'
white='\033[0;37m'
blue='\033[0;34m'
green='\033[0;32m'
bold='\033[1m'
restore_color='\033[0m\033[22m'

link_file() {
  if [ -e ~/$1 ]; then
    echo -e "${red}${bold}[ERROR]:${restore_color} $1 already exists"
  else
    ln -s $(pwd)/$1 ~/$1
    echo -e "${green}${bold}[OK]:${restore_color} $1 has linked"
  fi
}

link_file .bash_profile
link_file .zshrc
link_file .tmux.conf
link_file .zprofile
link_file .gitconfig
