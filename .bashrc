# .bashrc

# Diagnose what happens during bash startup and beyond (loads of output)
# Normally suggested to put in .bash_login ?
#set -x

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Constants
HELPER_TOOLS=~/opt/misc_helpers

# Environment variables
export EDITOR="/usr/bin/vim"

# Some interesting unicode characters
# Ϊ λ ❯ ❮ ♺ ✚ ⬆ ⬇ ✖ ✱ ➜ ✭ ◼

# perlbrew
#source ~/perl5/perlbrew/etc/bashrc
#export PERLBREW_ROOT=/mnt/NGS01/biss/perl5/perlbrew
#source ${PERLBREW_ROOT}/etc/bashrc

# Add bin paths - order matters! ;)
source ~/.bashrc.local.paths
export PATH=${HOME}/bin:${PATH}

# Add git autocompletion
#source /mnt/NGS01/biss/opt/recommended_configs/git-completion.bash

# Add git flow autocompletion
source ${HELPER_TOOLS}/git-flow-completion.bash

# Use python virtual environments
export VIRTUAL_ENV_DISABLE_PROMPT=1
# Following is for python 2.7 (where we use virtualenvwrapper)
export WORKON_HOME=~/.venv
#VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python2.7'
#source /mnt/ngs/biss/bin/virtualenvwrapper.sh
# For python 3.4+ we use pyvenv (installed systemwide)

# (Ana)Conda
export CONDA_ENVS_PATH=/mnt/ngstemp/Brian/condaenvs

# iRODS
# Use specific iRODS environment file like so:
#   export IRODS_ENVIRONMENT_FILE=/full/path/to/different/irods_environment.json
# Implement here to use dirrent iRODS env on as02-u, as02-t and as02-p (which is to be definitive?)

# User specific aliases and functions
alias l='ls'

###
### Functions
###

git-branch-name()
{
    echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
    #BRANCH_NAME=$(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
    if [ ! $? -eq 0 ]; then
        echo "no branch"
    fi
}

git-dirty()
{
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ ! $st =~ "working directory clean" ]]
    then
        echo "*"
    fi
}

git-ahead()
{
    brinfo=$(git branch -v | grep $(git-branch-name) 2>/dev/null)
    if [[ $brinfo =~ ("[ahead "([[:digit:]]*)]) ]]
    then
        echo " ${BASH_REMATCH[2]}⬆"
    fi
}

git-behind()
{
    brinfo=$(git branch -v | grep $(git-branch-name) 2>/dev/null)
    if [[ $brinfo =~ ("[behind "([[:digit:]]*)]) ]]
    then
        echo " ${BASH_REMATCH[2]}⬇"
    fi
}

gitify()
{
    status=$(git status 2>/dev/null | tail -n 1)
    if [[ $status == "" ]]; then
        echo ""
    else
        status2=$(git status 2>/dev/null | head -1)
        if [[ $status2 =~ "HEAD detached" ]]; then
            echo "DETACHED HEAD"
        #elif [[ $status2 =~ "Not currently on any branch" ]]; then
        #    echo "NO BRANCH"
        else
            echo "$(git-branch-name)$(git-dirty)$(git-ahead)$(git-behind)"
        fi
    fi
}

getpyvenv()
{
    if test -z "$VIRTUAL_ENV" ; then
        echo ""
    else
        echo " (pyenv:`basename \"$VIRTUAL_ENV\"`)"
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

PS1="${TIMESTAMP} [\h]${BYELLOW}\$(getgitstat)\$(getpyvenv)
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



# added by Anaconda3 4.4.0 installer
export PATH="/mnt/ngs/biss/opt/anaconda3/bin:$PATH"
