#!/bin/bash

DOT_FILES=(.tmux.conf .zshrc .latexmkrc .zprofile)
SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

echo $SCRIPT_DIR

for file in ${DOT_FILES[@]}; do
  ln -sfv $HOME/dotfiles/$file $HOME/$file
done
