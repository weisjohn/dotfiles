#!/bin/bash

# make default folders for code
mkdir $HOME/src && mkdir $HOME/mysrc

# install brew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

# run the .brew file, this gives us git, wget, ack
$HOME/.brew

# install nvm , node latest
git clone git://github.com/creationix/nvm.git $HOME/nvm
. $HOME/nvm/nvm.sh
nvm install 0.8.14

# install global node utilties 
npm install -g underscore vows express coffee-script 

# install z
cd $HOME/src
git clone git://github.com/rupa/z.git

# install rvm 
curl -L https://get.rvm.io | bash -s stable --ruby

# download all personal github repos

echo "please run the bootstrap.sh file now"