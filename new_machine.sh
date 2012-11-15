#!/bin/bash

# make default folders for code
mkdir $HOME/src && mkdir $HOME/mysrc

# install brew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

# run the .brew file, this gives us git, node, wget, ack
$HOME/.brew

# install nvm


# install z
cd $HOME/src
git clone git://github.com/rupa/z.git

# install rvm 
curl -L https://get.rvm.io | bash -s stable --ruby