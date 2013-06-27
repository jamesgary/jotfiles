#!/bin/bash -ex

repo_dir=$HOME/.homesick/repos
aptget='sudo apt-get'
if [ `whoami` = 'root' ]; then
  aptget='apt-get'
fi

$aptget update
$aptget install -y vim git-core

# homeshick
rm -rf $HOME/.homesick
git clone git://github.com/andsens/homeshick.git  $repo_dir/homeshick
git clone git://github.com/jamesgary/jotfiles.git $repo_dir/jotfiles
$repo_dir/homeshick/home/.homeshick link

# vundle
rm -rf $HOME/.vim/bundle/vundle
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +BundleInstall +qall

# source it!
source ~/.profile
