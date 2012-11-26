#!/bin/bash

# make default folders for code
mkdir -p $HOME/src && mkdir -p $HOME/mysrc

##################################################################
# languages and utilities       								 #
##################################################################

# install brew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

# run the .brew file, this gives us git, wget, ack
$HOME/.brew

# install pygments for docco
sudo easy_install pygments

# install nvm , node latest
git clone git://github.com/creationix/nvm.git $HOME/nvm
. $HOME/nvm/nvm.sh
nvm install 0.8.14

# install global node utilties 
npm install -g coffee-script docco node-dev

# install z
cd $HOME/src
git clone git://github.com/rupa/z.git

# install rvm 
curl -L https://get.rvm.io | bash -s stable --ruby

# install bundler, guard which are necessary for live-reload
#gem install bundler
#gem install guard
#gem install guard-livereload


##################################################################
# code and repos				       							 #
##################################################################

# download all my public github repos and my private gitolite repos into mysrc folder
cp ./github_mega_clone.js $HOME/mysrc
cp ./gitolite_mega_clone.js $HOME/mysrc
cp ./personal_repos.js $HOME/mysrc
cd $HOME/mysrc
npm install request underscore
node github_mega_clone.js
node gitolite_mega_clone.js
node personal_repos.js
rm -rvf $HOME/mysrc/node_modules github_mega_clone.js github_mega_clone.js personal_repos.js


##################################################################
# applications						       						 #
##################################################################

cd $HOME/Downloads
# TODO

##################################################################
# wallpapers and screen savers						       		 #
##################################################################

mkdir -p $HOME/Pictures/desktops
cp ./desktops.js $HOME/Pictures/desktops/.
cd $HOME/Pictures/desktops
npm install request underscore
node desktops.js
rm -rvf node_modules desktops.js

echo "please run the bootstrap.sh file now"