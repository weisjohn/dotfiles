#!/bin/bash

function doIt() {

# make default folders for code
mkdir -p $HOME/src && mkdir -p $HOME/mysrc

##################################################################
# languages and utilities       								 #
##################################################################

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
cp $HOME/src/solarized-dark-pygments/solarized.py /Library/Python/2.7/site-packages/Pygments-1.6-py2.7.egg/pygments/styles/.
# install solarized dark theme for ST2
git clone git://github.com/deplorableword/textmate-solarized.git $HOME/src/textmate-solarized
sudo cp -R $HOME/src/textmate-solarized/ $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ \-\ Solarized

# /Users/jweis/

# install nvm , node latest
curl https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | sudo bash
source $HOME/.nvm/nvm.sh
sudo -e nvm install 0.12.6
nvm use 0.12.6

# install global node utilties 
npm install -g bower browserify bunyan coffee-script docco docserv fixpack gulp jshint json kamino madeye mocha node-debug node-dev node-inspector npmd pageres tessel yo

# install gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)


# install z
cd $HOME/src
git clone git://github.com/rupa/z.git

# install rvm 
curl -L https://get.rvm.io | bash -s stable --ruby

# install compass and sass
gem install sass
gem install compass

# install bundler, guard which are necessary for live-reload
#gem install bundler
#gem install guard
#gem install guard-livereload


##################################################################
# code and repos				       							 #
##################################################################

# download all my public github repos and my private gitolite repos into mysrc folder
#cp ./github_mega_clone.js $HOME/mysrc
#cp ./gitolite_mega_clone.js $HOME/mysrc
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

# cd $HOME/Downloads
# TODO

# setup `subl` command
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /bin/subl

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
	echo "Applications that need to be installed: Chrome Canary, Sublime Text 3, LiveReload"
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
