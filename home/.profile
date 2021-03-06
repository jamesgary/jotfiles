#!/bin/bash

# TODO make a function out of:
# grep -ilr "OLD" components/ | xargs -I@ sed -i '' 's/OLD/NEW/g' @
# from http://stackoverflow.com/a/19861378
#alias fc='grep -ilr "OLD" components/ | xargs -I@ sed -i "" "s/OLD/NEW/g" @'

# fr old new dir
fr () {
  OLD=$1
  NEW=$2
  WHERE=$3

  ack -l "$OLD" $WHERE | while read -r grepped_file ; do
    perl -pi -w -e "s/$OLD/$NEW/g" $grepped_file
  done

  #for i in $FILES
  #do
  #  perl -pi -w -e "s/$OLD/$NEW/g" $i
  #done

  #LC_CTYPE=C && LANG=C && ack -f $1 $3 | xargs -I@ sed -i "" "s/$1/$2/g" @
  # why does it always complain "ack: $1: No such file or directory"?
}

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
alias tree='tree -I "*.pyc|node_modules" --matchdirs'
alias sapling='tree -I "*.pyc|__init__.py|tmp|node_modules|venv|docs|build|release|vendor|Godeps"'
alias sas='sudo apachectl start'
alias sar='sudo apachectl restart'
alias sl='scss-lint'
alias vc='find . -type f -name ".*.sw[op]" -exec rm -f {} \;'
alias gpom='git pull origin master'
alias json='python -mjson.tool'

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

##################
# shared history #
##################

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=50000
export HISTFILESIZE=50000
#source "$HOME"/.merge_history.bash

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source "$HOME/.git-completion.sh"

# Lastly, load sensitive stuff

if [ -f "$HOME/.private/work" ]; then
  . "$HOME/.private/work"
fi

export GOPATH=~/go
export PATH="/usr/local/heroku/bin:$PATH" # heroku toolbelt
export PATH=$GOPATH/bin:$PATH:/usr/local/go/bin
export PATH="/opt/chefdk/bin:$PATH"

[[ -s "/Users/jamesgary/.gvm/scripts/gvm" ]] && source "/Users/jamesgary/.gvm/scripts/gvm"
