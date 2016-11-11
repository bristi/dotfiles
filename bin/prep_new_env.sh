#!/bin/bash

# TODO: Option to build folder after installation
# TODO: Ask before installation

# Install folder for helper tools
HELPER_TOOLS_DIR=~/opt/misc_helpers

# Init bin and build folders
mkdir -p ~/bin
mkdir -p ${HELPER_TOOLS_DIR}
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

# Install vim-plug
echo "## INSTALLING : vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim-plug
echo "## INSTALLING : git-flow-completion.bash"
curl -fLo ${HELPER_TOOLS_DIR}/git-flow-completion.bash https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash

###
### Utilities where we create git repositories
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

# Install autoenv
echo "## INSTALLING : autoenv"
git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv

###
### Initializations
###

# Initializing vim
echo "## INITIALIZING : vim"
vim +PlugInstall +qall

# Initializing yadm
echo "## INITIALIZING : yadm"
# Apparently yadm does not use (all) my git settings?
# For the git installation on the current system this results in the error
#   fatal: The current branch master has multiple upstream branches, refusing to push.
# every time I do a yadm push. `yadm push -u origin master` works of course.
# Telling yadm (git) to only push current branch is a fix for this system.
yadm config push.default simple


