#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Diagnose what happens during bash startup and beyond (loads of output)
# Normally suggested to put in .bash_login ?
#set -x

# Some interesting unicode characters
# Ϊ λ ❯ ❮ ♺ ✚ ⬆ ⬇ ✖ ✱ ➜ ✭ ◼

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#
# Non-standard/custom programmable completion
#
# i-commands (iRODS)
source ~/.bash_completions_custom/i-commands-auto.bash

# Custom functions
source ~/.bashrc_functions

# Constants
#HELPER_TOOLS=~/opt/misc_helpers

###
### General settings
###

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### History settings

# See also
# * https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows/1292#1292
#

# Large history
export HISTSIZE=100000
export HISTFILESIZE=200000
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
# Note that the history (including what the former command(s) were) is no longer local
# in shell
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# Alternately
#export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


## System specifics

# Use this for seeing if we are on OSX?
if [[ "$OSTYPE" == darwin* ]]; then

    export BROWSER='open'

    # Set github api token for homebrew
    # Create and manage at https://github.com/settings/tokens - remember to unselect all scopes
    # for token as there is no need for it to access private information
    # NOTE: Do not put this in version control and upload to public repository ;)
    #export HOMEBREW_GITHUB_API_TOKEN=<insert token here>

#  # Turn off special handling of ._* files in tar, etc.
#  # http://superuser.com/questions/259703/get-mac-tar-to-stop-putting-filenames-in-tar-archives:
#  # prevent several of the system-supplied programs (including tar) from giving
#  # special meaning to ._* archive members. In particular, it will prevent them
#  # from:
#  #
#  # * storing extended attribute data (including resource forks) in ._* archive
#  #   members (i.e. do not “pollute” archives created on Mac OS X but meant for
#  #   use on other systems)
#  # * attempting to extract extended attributes orresources from archive
#  #   members named like ._* (i.e. do not misinterpret ._* archive members
#  #   in archives from other systems).
#
#  # The value you use for the environment variable is not important (it can even be the empty string). Values like 0, and false will not reenable the feature. The only thing that matters is whether the variable is set (you have to “unset” it to reenable the feature).
#  # When you need to, you can then unset the variable for individual commands:
#  # (unset COPYFILE_DISABLE; tar cf somefile.tar …)
#  # On this Mac OS X 10.6 system, the following commands all seem to know about COPYFILE_DISABLE:
#  #
#  # /usr/bin/tar (a symbolic link to bsdtar)
#  # /usr/bin/bsdtar
#  # /usr/bin/gnutar
#  # /bin/pax
#  #
#  # COPYFILE_DISABLE originated in Mac OS X 10.5. If you need to support 10.4, it has COPY_EXTENDED_ATTRIBUTES_DISABLE that works in the same way.
#  #
#  COPYFILE_DISABLE=1; export COPYFILE_DISABLE
fi


###
### Environments
###

## PERL

#if ! [[ "$PERL5LIB" =~ "/net/lib/perl5" ]]; then
#    #export PERL5LIB=/net/lib/perl5:$PERL5LIB
#    export PERL5LIB=$HOME/local/perl5/lib:$PERL5LIB
#fi

# perlbrew
#source ~/perl5/perlbrew/etc/bashrc
#export PERLBREW_ROOT=/mnt/NGS01/biss/perl5/perlbrew
#source ${PERLBREW_ROOT}/etc/bashrc

# Perl stuff
#PERL_MB_OPT="--install_base \"/Users/brian/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/brian/perl5"; export PERL_MM_OPT;

## PYTHON

#if ! [[ "$PYTHONPATH" =~ "/home/brian/data/modules" ]]; then
    #export PYTHONPATH=/home/brian/data/modules:/home/brian/lib/python2.6/site-packages:/opt/e17/lib/python2.6/site-packages:$PYTHONPATH
#fi

#
# Using pyenv
#

# To build framework versions of python on osX (and not static versions), necessary
# for eg building YouCompleteMe, use following flag:
# PYTHON_CONFIGURE_OPTS="--enable-framework"
# To enable shims and autocompletion add to your profile:
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#if [[ "$OSTYPE" == darwin* ]]; then
# To use Homebrew's directories rather than ~/.pyenv add to your profile:
#export PYENV_ROOT=/usr/local/var/pyenv
#fi

#
# Use python virtual environments
# For conda virtual environments, see conda section
#

# Disable automatic prompt modification
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Following is for python 2.7 (where we use virtualenvwrapper)
#export WORKON_HOME=~/.venv
#VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python2.7'
#source /mnt/ngs/biss/bin/virtualenvwrapper.sh

# For python 3.4+ we use pyvenv (installed systemwide) interchangeable
# virtualenv in regards to above settings
# Or conda for simpler data science related tasks
# * use `conda config --set changeps1 False` once to prevent changing
#   bash prompt. See prompt settings later on how to manually add env
#   name to prompt.
# See https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/ for
# some info on venv+pip vs conda


#
# Conda
#

source ~/.bashrc.local.conda

# Conda bash autocompletion
# Requires `conda install argcomplete`
# Note: Unsupported and phased out at python 3.6
#eval "$(register-python-argcomplete conda)"

# Toggle / remove conda from PATH
# This is necessary when we want to use system/brew python
# NOTE: Variable CONDAPATH must have been specified before using
# these. Probably happened in sourced file specific for environment.

## Var to keep tmp path while toggling
OLDPATH_WITH_CONDA=''
OLDPATH_OVERWRITTEN=''

# Used from command line as simply toggle_conda
toggle_conda () {
    if [ -z $OLDPATH_WITH_CONDA ]; then
        export OLDPATH_WITH_CONDA=$PATH
        path_remove $CONDAPATH
        echo "Conda off. Old PATH available as \$OLDPATH_WITH_CONDA"
    else
        # We maintain overwritten PATH as it may have been modified between
        # user toggling conda off and on
        export OLDPATH_OVERWRITTEN=$PATH
        export PATH=$OLDPATH_WITH_CONDA
        export OLDPATH_WITH_CONDA=''
        echo "Conda on. Overwritten PATH available as \$OLDPATH_OVERWRITTEN"
    fi
}

# Used from command line to temporarily change PATH while running command
# Eg if building stuff and you don't want conda python making a mess:
#   PATH=$(path_no_conda); ./configure
path_no_conda () {
    echo "$(remove_item_from_pathlike $CONDAPATH $PATH)"
}


## R

#if ! [[ "$R_LIBS_USER" =~ "/home/brian/local/lib/R/site-library" ]]; then
#    export R_LIBS_USER=/home/brian/local/lib/R/site-library:$R_LIBS_USER
#fi


## Dynamic linking

#export LD_LIBRARY_PATH=/opt/e17/lib:$LD_LIBRARY_PATH


## JAVA

# Hmmm Solstudio want path to bin but jabref want path to home?
#export JAVA_HOME=/opt/java/bin/java
#export JAVA_HOME=/opt/java


## Node

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## iRODS
# Use specific iRODS environment file like so:
#   export IRODS_ENVIRONMENT_FILE=/full/path/to/different/irods_environment.json
# NOTE: May also use shell script I created and put in bin: irodsenv


###
### PATH
###

# Add bin paths - order matters! ;)

source ~/.bashrc.local.paths

# MacPorts Installer addition on 2012-11-10_at_23:30:38: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Going from macports to homebrew
#export PATH=/usr/local/bin:$PATH
#path_prepend /usr/local/bin

# Using anaconda
# NOTE: conda is added after most other PATHs and thus probably after
# local/brew python (prepended, so higher prio)
#export PATH=/usr/local/anaconda3/bin:$PATH
#path_prepend /usr/local/anaconda3/bin
#path_prepend /home/brian/opt/anaconda3/bin
# Conda 4.4 recommends this confugration instead for using conda activate
#. /home/brian/opt/anaconda3/etc/profile.d/conda.sh
#  No more?
#. /home/brian/anaconda3/etc/profile.d/conda.sh
#path_prepend /home/brian/anaconda3/bin
if [[ -n ${CONDAPATH} ]]; then
    path_prepend ${CONDAPATH}
fi

path_prepend ~/bin


###
### Completion
###

# git flow completion
#source ~/opt/ressources/git-completion.bash
#source ~/bin/git-flow-completion.bash
#source ~/opt/ressources/git-flow-completion.bash

# Add git autocompletion
#source /mnt/NGS01/biss/opt/recommended_configs/git-completion.bash


###
### Aliases
###

## Note that it is sometimes better to make a shell script as aliases are
## not always read, eg pipes or when using terminal applications like ipython

# Colors in terminal + related aliases
if [ "$TERM" != "dumb" ]; then
    #eval "`dircolors -b`"
    alias ls='ls --group-directories-first --color=auto'
    #alias ls='ls -G'
    # To always send color ANSI codes
    # A pipe is not always a good place to send ANSI codes but if
    # something like less -R is receiving it might be preferable..
    #alias lc='ls --group-directories-first --color=always'
    alias la='ls -A'
    alias ll='ls -l'
    alias l='ls -CF'

    # make less display color
    # Note: doing it as alias doesn't work when less is used from eg ipython (with help)
    alias less='less -R'
    export LESS="-R"

    # grep color
    alias grep='grep --color=auto'
    alias grepc='grep --color=always'       # analogous to lc
    # Following is thus deprecated
    #export GREP_OPTIONS='--color=auto'

    # diff color - requires program colordiff
    #alias diff='colordiff'

    # colored GCC warnings and errors
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
fi


# X forwarded and faster, more compressed ssh (marginally..)
#alias sshplain='/usr/bin/ssh'
alias sshff='ssh -XC4c arcfour,blowfish-cbc'

# I usually sort data with . as decimal separator..
# Consider setting these globally instead.
alias sortus='LC_NUMERIC="en_US.UTF8" LC_TIME="en_US.UTF8" sort'

# When updating vim plugins we don't want conda in path (vim was built with other python)
alias vimplugupdate='PATH=$(path_no_conda); vim +PlugInstall! +qall'

# stuff
alias zzz='sleep 10'

# OSX specifics
if [[ "$OSTYPE" == darwin* ]]; then
    # When using brew, we don't want to have conda in path
    # Note that this would be specific for osx (homebrew package manager)
    alias brew='PATH=$(path_no_conda); brew'

    # Clean up LaunchServices to remove duplicates in the “Open With”
    # menu. Could also use (free) app Onyx
    # http://apple.stackexchange.com/questions/68596/why-does-my-macs-list-of-open-with-applications-start-listing-the-apps-twice
    # http://www.titanium.free.fr/ (Onyx)
    alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
    # or?
    #/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user
fi

# Arch linux specifics
# Just inferring this by checking for the pacman command..
if [[ ! $(which pacman 1>/dev/null 2>/dev/null; echo "$?") == "0" ]]; then
    # pacman alias commands
    alias pacu='sudo pacman -Syu' # Update the system and upgrade all system packages.
    alias paci='sudo pacman -S' # Install a specific package from repos added to the system
    alias pacl='sudo pacman -U' # Install specific package that has been downloaded to the local system
    alias paci='pacman -Si' # Display information about a given package located in the repositories
    alias pacs='pacman -Ss' # Search for package or packages in the repositories
    alias pacr='sudo pacman -R' # Remove the specified package or packages but retain its configuration and required dependencies
    alias pacrall='sudo pacman -Rns' # Remove the specified package or packages , its configuration and all unwanted dependencies
    alias pacsl='pacman -Qi' # Display information about a given package in the local database
    alias paclocs='pacman -Qs' # Search for package/packages in the local database
    alias yaconf='yaourt -C' # Fix all configuration files with vimdiff

    # yaourt alias commands
    alias yau='yaourt -Syua' # Synchronize with repositories and upgrade packages out of date in the system, including AUR packages.
    alias yaui='yaourt -S' # Install a specific package from repos added to the system
    alias yaul='yaourt -U' # Install specific package that has been downloaded to the local system
    alias yaur='yaourt -R' # Remove the specified package or packages but retain its configuration and required dependencies
    alias yaurall='yaourt -Rns' # Remove the specified package or packages , its configuration and all unwanted dependencies
    alias yaui='yaourt -Si' # Display information about a given package located in the repositories
    alias yaus='yaourt -Ss' # Search for package or packages in the repositories
    alias yauil='yaourt -Qi' # Display information about a given package in the local database
    alias yausl='yaourt -Qs' # Search for package(s) in the local database
    alias yaul='yaourt -Qe' # List installed packages, even those installed from AUR (they're tagged as "local")
    alias yauo='yaourt -Qtd' # Remove orphans using yaourt
fi


###
### Preference settings
###

# applications
export EDITOR=vim
export PAGER=less
#export BROWSER=/usr/bin/chromium
export BROWSER=firefox
export GIT_EDITOR=vim
export GIT_PAGER=less


## locale settings

#if [[ -z "$LANG" ]]; then
#  export LANG='en_US.UTF-8'
#fi

#export LANG=en_DK.UTF8
#export LC_CTYPE=en_US.UTF8
#export LC_ALL=en_US
## testing...
#export LANG=en_DK.UTF-8
#export LC_CTYPE="en_US.UTF-8"
#export LC_NUMERIC="en_DK.UTF-8"
#export LC_TIME="en_DK.UTF-8"
#export LC_COLLATE="en_DK.UTF-8"
#export LC_MONETARY="en_DK.UTF-8"
#export LC_MESSAGES="en_DK.UTF-8"
#export LC_PAPER="en_DK.UTF-8"
#export LC_NAME="en_DK.UTF-8"
#export LC_ADDRESS="en_DK.UTF-8"
#export LC_TELEPHONE="en_DK.UTF-8"
#export LC_MEASUREMENT="en_DK.UTF-8"
#export LC_IDENTIFICATION="en_DK.UTF-8"
#export LC_ALL=en_DK.UTF-8


###
### Prompt
###

## Console colours - color name examples output by color_console.sh (and 2)
## In a nutshell:
##   \[\033[mode;foregroundm\033[backgroundm\]
## Note that colors not set are reused and 'm' should be appended to color
## or mode if no color.
## OR:
##   \[\033[mode;foreground;backgroundm\]  (with 'm' at last color)
##
## modes: 0 - normal, 1 - bold, 4 - underline, 5 - blink, 7 - inverse
## colors: foregrounds in 30's, backgrounds in 40's
##      0-7 are black,red,green,yellow,blue,magenta,cyan,white
## ex; bold blue text: \[\033[1;34m\]
##     normal green on yellow: \[\033[0;32;43m\]
##
## Non-printing escape sequences have to be enclosed in \[\033[ and \] for bash to be
## able to calculate proper prompt length. A garbled prompt when browsing history (up
## and down arrows) or using home or end keys is often because of a missing enclosure.
##
## For colour escape sequences, they should also be followed by a lowercase m.

# In following vars, bold is also a 'lighter' version of the color
COLOR_RESET="\[\033[m\]"
# Background
BG_GREY="\[\033[40m\]"  # background grey
# Text
BBLACK="\[\033[1;30m\]"         # bold black (dark grey)
BRED="\[\033[1;31m\]"           # bold red
BGREEN="\[\033[1;32m\]"         # bold green
BYELLOW="\[\033[1;33m\]"        # bold yellow
BBLUE="\[\033[1;34m\]"          # bold blue
BMAGENTA="\[\033[1;35m\]"       # bold magenta
BCYAN="\[\033[1;36m\]"          # bold cyan
BGREY="\[\033[1;37m\]"          # white
BLACK="\[\033[0;30m\]"    # black (very dark grey)
RED="\[\033[0;31m\]"      # red
GREEN="\[\033[0;32m\]"      # green
BLUE="\[\033[0;34m\]"     # blue
MAGENTA="\[\033[0;35m\]"       # magenta
CYAN="\[\033[0;36m\]"          # cyan
GREY="\[\033[0;37m\]"          # grey

# Prints return value > 0 in parantheses in red text
PROMPT_COMMAND='RET=$?;'
RET_VALUE='$(test $RET -ne 0 && echo -ne "\[\033[0;31m\]($RET) ")'
PROMPT_SIGN="${COLOR_RESET}\[\e[38;5;208m\]λ"
TIMESTAMP="\[\e[90m\]\D{%a %d %b %H:%M}"
#TIMESTAMP="\[\e[90m\]\D{%Y-%m-%d %H:%M}"

## Prompt types (from bash(1))
# PS1   The value of this parameter is expanded (see PROMPTING below)  and  used  as  the
#       primary prompt string.  The default value is ``\s-\v\$ ''.
# PS2   The  value  of  this  parameter is expanded as with PS1 and used as the secondary
#       prompt string.  The default is ``> ''.
# PS3   The value of this parameter is used as the prompt for  the  select  command  (see
#       SHELL GRAMMAR above).
# PS4   The  value  of  this  parameter  is expanded as with PS1 and the value is printed
#       before each command bash displays during an execution trace.  The first character
#       of PS4 is replicated multiple times, as necessary, to indicate multiple levels of
#       indirection.  The default is ``+ ''.
## PS1
## For the special characters connecting lines, see
# www.gilesorr.com/bashprompt/howto/
# Especially 6.7 'Line draw characters without VGA fonts'
## The actual prompt
#PS1="$BBLACK/(\D{%a %d %b %H:%M})-(\w)\n$BBLACK[$BGREEN\u@\h$BBLACK:$BBLUE\W$BBLACK]$COLOR_RESET$GREEN$GIT_BRANCH_NAME$BGREEN$RET_VALUE\$$COLOR_RESET "
#
#PS1="\[\033[1;30m\](\D{%a %d %b %H:%M}) \[\033[1;33m\]\$(getgitstat) \$(getpyvenv)
#\[\033[1;34m\]\W \[\033[1;32m\]\$ \[\033[m\]"

PS1="${TIMESTAMP} [\h]${BYELLOW}\$(getgitstat)\$(getpyvenv)
${CYAN}\W ${RET_VALUE}${PROMPT_SIGN}${COLOR_RESET} "

## This is a red prompt for use with root
##
# Root prompt should be red..
#PS1="\[\033[1;31m\]\u@\h:\w# \[\033[m\]"

## Hmm.. This page seems cool - perhaps use something from there:
## http://wiki.archlinux.org/index.php/Color_Bash_Prompt

# KDE wants to start in ~/Documents. Stupid KDE.
#cd $HOME

# This should be cleaned up. See for instance http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff
# http://tldp.org/LDP/abs/html/sample-bashrc.html
# http://bodhizazen.net/Tutorials/bashrc

## Prompt for use on servers with lousy prompt settings
# PS1="\[\033[0;35m\]\u@\h\[\033[0;30m\]:\[\033[1;34m\]\W \[\033[1;32m\]\$ \[\033[m\]"


# Use autoenv
# $ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
# CAVEAT This must be sourced after setting prompt as otherwise pyvenv will not have
# the correct _OLD_VIRTUAL_PS1 environment variable to reset prompt to.
#source ${HOME}/.autoenv/activate.sh

## added by Anaconda3 2018.12 installer
## >>> conda init >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/brian/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/home/brian/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/brian/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/home/brian/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda init <<<
