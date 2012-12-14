#!/bin/bash

dotfiles=".bashrc .profile .bash_login .bash_profile"
prefix=$HOME

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Verify that we aren't overwriting files or links
for file in $dotfiles; do
  if [ -e $HOME/$file ]; then
    echo "Error! The file $HOME/$file already exists. Doing nothing..."
    exit 1
  fi
done

for file in $dotfiles; do
  echo "Linking file $HOME/$file to $this_dir/bash_dispatch..."
  cmd="ln -s $this_dir/bash_dispatch $HOME/$file"
  echo $cmd
  $cmd
done
