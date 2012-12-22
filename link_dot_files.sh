#!/bin/bash

dotfiles=".bashrc .bash_login .bash_profile"
prefix=$HOME

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# .profile is special. Since /bin/sh sources this, and sh is not 
# compatible with bash commands necessarily (e.g. source vs .), 
# we need to remove .profile completely.
if [ -e ${HOME}/.profile ]; then
  echo "Warning! ~/.profile exists! Please remove or rename this file to avoid incompatability between bash and sh."
  exit 1
fi


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
