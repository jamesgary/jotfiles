#!/bin/bash -ex

pushd $HOME

aptget='sudo apt-get'
if [ `whoami` = 'root' ]; then
	aptget='apt-get'
fi

$aptget update
$aptget install -y vim git
git clone git://github.com/jamesgary/jotfiles.git $HOME/.homesick/repos/jotfiles
$HOME/.homesick/repos/jotfiles/home/.homeshick link
