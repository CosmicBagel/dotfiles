# use the correct editor for ctrl+x ctrl+e
# also used by some apps to determine default editor
export EDITOR="nvim"
export VISUAL="nvim"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
setopt APPEND_HISTORY

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE
HISTFILESIZE=$HISTSIZE

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# setopt -s checkwinsize
# not needed in ZSH

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# when homebrew is updating programs, don't require me to allow every single app
export HOMEBREW_CASK_OPTS=--no-quarantine
