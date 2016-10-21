# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

echo Sourcing bashrc...
echo 'Remember ... (Middle-click is one-finger-touch-+-command)'

# See bash(1) for more options
HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

# I hate bash programmatic completion
## enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
complete -r

# Smrt way to add paths
pathadd() {
	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
		PATH=$1"${PATH:+":$PATH"}"
#  else
#    echo "pathadd(): directory not valid or already exists in PATH"
	fi
}
pathadd ~/bin
