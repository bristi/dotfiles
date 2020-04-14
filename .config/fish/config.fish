# # General stuff about fish
#
# # http://fishshell.com/docs/current/index.html#variables
#
# # A bit about aliases in fish
#
# # Define alias in shell
# alias rmi "rm -i"
# 
# # Define alias in config file
# alias rmi="rm -i"
# 
# # This is equivalent to entering the following function:
# function rmi
#     rm -i $argv
# end
# 
# # Then, to save it across terminal sessions, if it was defined in shell:
# funcsave rmi
#
# # This last command creates the file ~/.config/fish/functions/rmi.fish
# # Read more in doc: https://fishshell.com/docs/current/commands.html#alias

# Remove certain items from history
# function ignorehistory --on-event fish_prompt # or maybe fish_preexec, see function --help
#     # This doesn't work. Could just use them in prefix as with jrnl instead?
#     #history --delete fg bg
#     history delete --prefix jrnl jrnw jrnp
# end

# Aliases

alias vim="nvim"
alias docker-stop-running='docker stop (docker ps -q)'

# Get termial dimensions
alias dim='echo (tput cols)x(tput lines)'


# Greeting
# Remove greeting
set fish_greeting

# Spacefish prompt settings
# For defaults, see https://github.com/matchai/spacefish/blob/master/docs/Options.md
# For special color codes: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# set SPACEFISH_PROMPT_ORDER time user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char
set SPACEFISH_PROMPT_ORDER time user host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext line_sep exec_time dir battery jobs exit_code char

set SPACEFISH_DATE_SHOW false
# Note that we show date through the time format
set SPACEFISH_TIME_SHOW true
set SPACEFISH_TIME_FORMAT '%b%d %H:%M'
set SPACEFISH_TIME_COLOR grey
set SPACEFISH_PROMPT_DEFAULT_PREFIX ""

set SPACEFISH_USER_PREFIX ""

set SPACEFISH_DIR_TRUNC 1
set SPACEFISH_DIR_TRUNC_REPO false
set SPACEFISH_DIR_PREFIX ""

set SPACEFISH_GIT_PREFIX ""
set SPACEFISH_GIT_STATUS_COLOR magenta

set SPACEFISH_DOCKER_SHOW false

set SPACEFISH_BATTERY_SHOW false

set SPACEFISH_EXIT_CODE_SHOW true

set SPACEFISH_CHAR_SYMBOL λ
set SPACEFISH_CHAR_COLOR_SUCCESS ff8700
# Because we show the exit code (in red) we do not change the color here)
set SPACEFISH_CHAR_COLOR_FAILURE ff8700

# PATHs

# CAVEAT: Following overrides equivalent system tools
# gnu coreutils
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
# gnu findutils
set -gx PATH /usr/local/opt/findutils/libexec/gnubin $PATH
# gnu grep
set -gx PATH /usr/local/opt/grep/libexec/gnubin $PATH

# my executables
set -gx PATH $HOME/bin $PATH


# pyenv
# pyenv init - | source
source (pyenv init - | psub)

# rbenv
source (rbenv init - | psub)

# goenv
source (goenv init - | psub)
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
