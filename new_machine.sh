#!/bin/bash

function doIt() {

# make default folders for code
mkdir -p $HOME/src && mkdir -p $HOME/mysrc

##################################################################
# languages and utilities       								 #
##################################################################

# prompt for xcode install
xcode-select --install

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# run the .brew file, this gives us git, wget, ack
chmod u+x $HOME/.brew
$HOME/.brew

# install git extras
(cd /tmp && git clone --depth 1 https://github.com/tj/git-extras.git && cd git-extras && sudo make install)

# install pygments for docco
sudo easy_install pygments
# install solarized dark theme for colorized cat with pygments
git clone git://github.com/gthank/solarized-dark-pygments.git $HOME/src/solarized-dark-pygments
cp $HOME/src/solarized-dark-pygments/solarized256.py /Library/Python/2.7/site-packages/Pygments-1.6-py2.7.egg/pygments/styles/.

# install mon & mongroup
(mkdir /tmp/mon && cd /tmp/mon && curl -L# https://github.com/tj/mon/archive/master.tar.gz | tar zx --strip 1 && make install && rm -rf /tmp/mon)
(mkdir /tmp/mongroup && cd /tmp/mongroup && curl -L# https://github.com/Ensequence/mongroup/archive/master.tar.gz | tar zx --strip 1 && make install)


# $HOME

# install nvm , node latest
git clone https://github.com/creationix/nvm.git $HOME/.nvm
cd $HOME/.nvm
git checkout v0.33.8
. nvm.sh
export NODE_VERSION=9.8.0
nvm install $NODE_VERSION
nvm use $NODE_VERSION

# install global node utilties
npm install -g bunyan kamino nodemon

# install gvm
bash < <(curl -sSL https://raw.githubusercontent.com/markeissler/gvm2/master/binscripts/gvm-installer)
source $HOME/.gvm/scripts/gvm
gvm install go1.4
gvm use go1.4
gvm install go1.10


# install z
cd $HOME/src
git clone git://github.com/rupa/z.git

# install rvm
curl -L https://get.rvm.io | bash -s stable --ruby


##################################################################
# code and repos				       							 #
##################################################################

# download all my public github repos and my private gitolite repos into mysrc folder
#cp ./personal_repos.js $HOME/mysrc
#cd $HOME/mysrc
#npm install request underscore
#node github_mega_clone.js
#node gitolite_mega_clone.js
#node personal_repos.js
#rm -rvf $HOME/mysrc/node_modules github_mega_clone.js github_mega_clone.js personal_repos.js


##################################################################
# applications						       						 #
##################################################################

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
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	echo "Applications that need to be installed: Chrome Canary"
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
