#!/bin/bash

set -e

red='\033[0;31m'
white='\033[0;37m'
blue='\033[0;34m'
green='\033[0;32m'
bold='\033[1m'
restore_color='\033[0m\033[22m'

if [ -z "$DEST_DIR" ]; then
  export DEST_DIR="$HOME/.dotfiles"
fi

link_file() {
  if [ -e ~/$1 ]; then
    echo -e "${red}${bold}[Warning]:${restore_color} $1 already exists"
    echo "Removing ..."
    rm ~/$1
  fi
  echo "Linking ..."
  ln -s $DEST_DIR/$1 ~/$1
  echo -e "${green}${bold}[OK]:${restore_color} $1 has linked"
}

link_file .bash_profile
link_file .zshrc
link_file .tmux.conf
link_file .zprofile
link_file .gitconfig
link_file contestapplet.conf
