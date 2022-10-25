#!/bin/bash

<<<<<<< HEAD
DOT_FILES=(.zshrc)
SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

for file in ${DOT_FILES[@]}; do
  ln -sfv $SCRIPT_DIR/$file $HOME/$file
=======
DOT_FILES=(.tmux.conf .zshrc .latexmkrc .zprofile)
SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

echo $SCRIPT_DIR

for file in ${DOT_FILES[@]}; do
  ln -sfv $HOME/dotfiles/$file $HOME/$file
>>>>>>> 6f9b4e230c596de833572a4c503279304b09c49d
done
