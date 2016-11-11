#!/bin/bash

# TODO: Option to build folder after installation
# TODO: Ask before installation
# TODO:

# Init bin and build folders
mkdir -p ~/bin
mkdir -p ~/build/prep_env
cd ~/build/prep_env

CWD=`pwd`

###
### Utilities NOT in vcs repositories
###

# Install (exuberant) ctags from ctags.sourceforge.net
echo "## INSTALLING : ctags"
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar xzf ctags-5.8.tar.gz
cd ctags-5.8
./configure
make
cp ctags ~/bin/ctags && chmod 0755 ~/bin/ctags
cd ..
rm -Rf ctags-5.8 ctags-5.8.tar.gz

# Install ack
echo "## INSTALLING : ack"
curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 ~/bin/ack

###
### Utilities in vcs repositories
###

# Install powerline fonts
# TODO: Should these be put elsewhere if linked by installation?
echo "## INSTALLING : powerline fonts"
git clone https://github.com/powerline/fonts.git powerline-fonts
cd $_
./install.sh
cd ..

# Install tmux-mem-cpu-load
echo "## INSTALLING : tmux-mem-cpu-load"
git clone https://github.com/thewtex/tmux-mem-cpu-load.git tmux-mem-cpu-load
cd $_
cmake .
make
cp tmux-mem-cpu-load ~/bin/
cd ..



