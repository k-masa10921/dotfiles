 #!/bin/bash

DOT_FILES=(.tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -sfv $HOME/dotfiles/$file $HOME/$file
done
