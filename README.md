Easier dotfile bootstrapping using [homeshick](https://github.com/andsens/homeshick).

Run this script to load everything:

```
#!/bin/bash -ex

pushd $HOME

repo_dir=$HOME/.homesick/repos
aptget='sudo apt-get'
if [ `whoami` = 'root' ]; then
  aptget='apt-get'
fi

$aptget update
$aptget install -y vim git-core
rm -rf $HOME/.homesick
git clone git://github.com/andsens/homeshick.git  $repo_dir/homeshick
git clone git://github.com/jamesgary/jotfiles.git $repo_dir/jotfiles
$repo_dir/jotfiles/home/.homeshick link
```
