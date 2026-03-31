#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

echo "Setting up dotfiles from $SCRIPT_DIR"

# ホームディレクトリ直下のdotfiles
DOT_FILES=(.tmux.conf .zshrc .latexmkrc .zprofile .gitconfig .gitignore_global)

for file in ${DOT_FILES[@]}; do
  ln -sfv "$SCRIPT_DIR/$file" "$HOME/$file"
done

# .config 以下のdotfiles
CONFIG_DIRS=(fish/config.fish nvim/init.vim)

for file in ${CONFIG_DIRS[@]}; do
  mkdir -p "$HOME/.config/$(dirname $file)"
  ln -sfv "$SCRIPT_DIR/.config/$file" "$HOME/.config/$file"
done

echo "Done!"
