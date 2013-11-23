#!/bin/bash

PATH=/usr/local/bin:/usr/local/sbin:$PATH

#################
# handy aliases #
#################

# bundler
alias bi='bundle install'
alias be='bundle exec'
alias bep='bundle exec padrino'

# misc
alias fu='touch tmp/restart.txt' # I'm usually angry at this point.
alias servethis='python -m SimpleHTTPServer 8000'
alias tree='tree -I "*.pyc"'
alias sapling='tree -I "*.pyc|__init__.py|tmp|node_modules|venv|docs|build|release|vendor"'
alias sas='sudo apachectl start'
alias sar='sudo apachectl restart'

# always open vim with multiple files in tabs
alias vi='vim -p'

#######################
# command line voodoo #
#######################

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

parse_git_branch()
{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

proml()
{
  local     BG_BLUE="\[\033[44m\]";
  local LIGHT_GREEN="\[\033[0;32m\]";
  local         RED="\[\033[0;31m\]";
  local       WHITE="\[\033[0;37m\]";
  local      YELLOW="\[\033[0;33m\]";

  PS1="$YELLOW\u$RED\w$BG_BLUE\$(parse_git_branch)$LIGHT_GREEN \t \$ $WHITE";
  PS2='> ';
  PS4='+ '
}

proml

###################
# Auto-virtualenv #
###################

# The virtualenv will be activated automatically when you enter the directory.

_virtualenv_auto_activate() {
  for location in '.venv', 'venv'
  do
    if [ -e "$location/bin/activate" ]; then
      # Check to see if already activated to avoid redundant activating
      if [ "$VIRTUAL_ENV" != "$(pwd -P)/$location" ]; then
        _VENV_NAME=$(basename `pwd`)
        echo Activating virtualenv \"$_VENV_NAME\"...
        VIRTUAL_ENV_DISABLE_PROMPT=1
        source $location/bin/activate
        _OLD_VIRTUAL_PS1="$PS1"
        PS1="($location)$PS1"
        export PS1
      fi
    fi
  done
}

export PROMPT_COMMAND=_virtualenv_auto_activate

#################################################
# handy grep aliases, but trying to use ack now #
#################################################

export GREP_COLOR='1;33;41'
alias ugrep='grep -rI --color'
alias ucgrep='grep -rI --color --context=5'

#################
# Miscellaneous #
#################

# see http://stackoverflow.com/questions/6970545/make-error-installing-ruby-1-9-2-with-rvm-and-readline-under-osx-lion
export ARCHFLAGS='-arch x86_64'
export ARCH='-arch x86_64'
export VISUAL=vim
export EDITOR=vim
export PATH="/usr/local/heroku/bin:$PATH" # heroku toolbelt
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Lastly, load sensitive stuff

if [ -f "$HOME/.private/work" ]; then
  . "$HOME/.private/work"
fi
