# .bashrc

# Diagnose what happens during bash startup and beyond (loads of output)
# Normally suggested to put in .bash_login ?
#set -x

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source global bash completions
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
else
    for file in /etc/bash_completion.d/* ; do
        source "$file"
    done
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

###
### Constants and general settings
###

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

###
### General settings
###

# preference settings
export EDITOR=vim
export PAGER=less
export GIT_EDITOR=vim
export GIT_PAGER=less

# X forwarded and faster, more compressed ssh (marginally..)
#alias sshplain='/usr/bin/ssh'
#alias ssh='ssh -XC4c arcfour,blowfish-cbc'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

###
### Application specific settings
###

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Custom helper tools
HELPER_TOOLS=~/opt/misc_helpers

# Some interesting unicode characters
# Ϊ λ ❯ ❮ ♺ ✚ ⬆ ⬇ ✖ ✱ ➜ ✭ ◼

# perlbrew
#source ~/perl5/perlbrew/etc/bashrc
#export PERLBREW_ROOT=/mnt/NGS01/biss/perl5/perlbrew
#source ${PERLBREW_ROOT}/etc/bashrc

# Add bin paths - order matters! ;)
source ~/.bashrc.local.paths
#export PATH=${HOME}/bin:${PATH}
# added by Anaconda3 4.4.0 installer
#export PATH="/home/brian/.anaconda3/bin:$PATH"
path_prepend ${HOME}/.anaconda3/bin
path_prepend ${HOME}/bin

# Add git autocompletion
#source /mnt/NGS01/biss/opt/recommended_configs/git-completion.bash

# Add git flow autocompletion
source ${HELPER_TOOLS}/git-flow-completion.bash

###
### Use python virtual environments
###

# We don't want virtualenv or pyvenv to set our prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
# To prevent (ana)conda from setting our prompt run command:
#   conda config --set changeps1 no
# Or set following in .condarc
#   changeps1: False

# Settings for virtualenvwrapper
#export WORKON_HOME=~/.venvs
#VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python2.7'

# Conda environments (default) location(s). Can also use 'envs_dirs' option
# in .condarc
export CONDA_ENVS_PATH=~/.condaenvs

# Conda bash autocompletion
# Requires `conda install argcomplete`
# Note: Unsupported and phased out at python 3.6
#eval "$(register-python-argcomplete conda)"

# Toggle / remove conda from PATH
# This is necessary when we want to use system/brew python

# Get this some other, more agnostic, way..
#CONDAPATH=/usr/local/anaconda3/bin
CONDAPATH=$(grep -oE [^:][a-zA-Z0-9\./]+conda[2-3]/bin <<< "$PATH")
# Var to keep tmp path while toggling
CONDA_TOGGLE_PATH=''

# Saves current PATH in CONDA_TOGGLE_PATH and removes anaconda from current PATH
# if CONDA_TOGGLE_PATH is empty. Otherwise restores(!) PATH from CONDA_TOGGLE_PATH.
toggle_conda () {
    if [ -z $CONDA_TOGGLE_PATH ]; then
        export CONDA_TOGGLE_PATH=$PATH
        path_remove $CONDAPATH
    else
        # TODO: Insert check here for whether PATH has changed further
        export PATH=$CONDA_TOGGLE_PATH
        export CONDA_TOGGLE_PATH=''
    fi
}

path_no_conda () {
    echo "$(remove_item_from_pathlike $CONDAPATH $PATH)"
}

###
### User specific aliases and functions
###

# ls color + aliases
if [ "$TERM" != "dumb" ]; then
    #eval "`dircolors -b`"
    alias ls='ls --group-directories-first --color=auto'
    alias la='ls -A'
    alias ll='ls -l'
    alias l='ls -CF --group-directories-first --color=auto'
    # An alias to always send color ANSI codes
    # Note that a pipe is not always a good place to send ANSI codes but if
    # something like less -R is receiving it might be preferable..
    alias lc='ls --group-directories-first --color=always'
fi

# make less display color
# Note: doing it as alias doesn't work when less is used from eg ipython (with help)
alias less='less -R'
export LESS="-R"

# grep color
alias grep='grep --color=auto'
alias grepc='grep --color=always'       # analogous to lc
# Following is the way I used to do it
#export GREP_OPTIONS='--color=auto'

# diff color - requires program colordiff
#alias diff='colordiff'

# I usually sort data with . as decimal separator..
# Consider setting these globally instead.
#alias sort='LC_NUMERIC="en_US.UTF8" LC_TIME="en_US.UTF8" sort'

# For terminals like mate-terminal this was necessary
alias tmux='TERM=xterm-256color tmux'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# stuff
alias zzz='sleep 10'

###
### Miscelaneous settings
###

source ${HOME}/.bashrc.local.misc

###
### locale settings
###

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

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
### Functions
###

git-branch-name()
{
    echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git-dirty()
{
    st=$(git status 2>/dev/null | tail -n 1)
    #if [[ $st != "nothing to commit (working directory clean)" ]]
    if [[ ! $st =~ "working "[[:alpha:]]+" clean" ]]; then
        echo "*"
    fi
}

git-ahead()
{
    brinfo=$(git branch -v | grep $(git-branch-name))
    if [[ $brinfo =~ ("[ahead "([[:digit:]]*)]) ]]
    then
        echo " ${BASH_REMATCH[2]}⬆"
    fi
}

git-behind()
{
    brinfo=$(git branch -v | grep $(git-branch-name))
    if [[ $brinfo =~ ("[behind "([[:digit:]]*)]) ]]
    then
        echo " ${BASH_REMATCH[2]}⬇"
    fi
}

gitify()
{
    #status=$(git status 2>/dev/null | tail -n 1)
    status=$(git status 1>/dev/null 2>/dev/null ; echo "$?")
    if [[ ! $status == "0" ]]; then
        echo ""
    else
        status2=$(git status 2>/dev/null | head -1)
        if [[ $status2 =~ "HEAD detached" ]]; then
            echo "DETACHED HEAD"
        else
            echo "$(git-branch-name)$(git-dirty)$(git-ahead)$(git-behind)"
        fi
    fi
}

getpyvenv()
{
    if test -n "$VIRTUAL_ENV" ; then
        echo " (pyenv:`basename \"$VIRTUAL_ENV\"`)"
    # Which of these conda envs is correct?
    elif test -n "$CONDA_DEFAULT_ENV" ; then
        echo " (pyenv:`basename \"$CONDA_DEFAULT_ENV\"`)"
    elif test -n "$CONDA_PREFIX" ; then
        echo " (pyenv:`basename \"$CONDA_PREFIX\"`)"
    else
        echo ""
    fi
}

getgitstat()
{
    MY_GIT_STAT=$(gitify)
    if test -z "$MY_GIT_STAT" ; then
        echo ""
    else
        echo " (git:${MY_GIT_STAT})"
    fi
}

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
##

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

PS1="${TIMESTAMP}${BYELLOW}\$(getgitstat)\$(getpyvenv)
${CYAN}\W ${RET_VALUE}${PROMPT_SIGN}${COLOR_RESET} "

## This is a red prompt for use with root
##
# Root prompt should be red..
#PS1="\[\033[1;31m\]\u@\h:\w# \[\033[m\]"

# + python virtual environment
#source /mnt/ngs/biss/opt/recommended_configs/git_prompt_custom.bash
#PS1="\[\033[1;30m\](\D{%a %d %b %H:%M}) \[\033[1;33m\]\$(getgitstat) \$(getpyvenv)
#\[\033[1;34m\]\W \[\033[1;32m\]\$ \[\033[m\]"

# Prompt for use on servers with lousy prompt settings
# PS1="\[\033[0;35m\]\u@\h\[\033[0;30m\]:\[\033[1;34m\]\W \[\033[1;32m\]\$ \[\033[m\]"


# Use autoenv
# $ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
# CAVEAT This must be sourced after setting prompt as otherwise pyvenv will not have
# the correct _OLD_VIRTUAL_PS1 environment variable to reset prompt to.
source ${HOME}/.autoenv/activate.sh


