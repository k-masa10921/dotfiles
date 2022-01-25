#!/bin/bash

DOT_FILES=(.zshrc)
SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

for file in ${DOT_FILES[@]}; do
  ln -sfv $SCRIPT_DIR/$file $HOME/$file
done
