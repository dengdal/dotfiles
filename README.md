dotfiles
========

For all my dotfiles

Clone including submodules: 
   git clone --recursive https://github.com/dengdal/dotfiles.git ~/.dotfiles

To install, just run:
   install.sh

To set your github identity for further pushes, use settings from:
   gitconfig.txt

Remember:
At later 'git pull', do:
   git submodule init
   git submodule update
In order to get new modules in /bundle

To build VIM with lua support (needed for neocomplete):
  http://stackoverflow.com/questions/19472554/build-vim-with-lua-on-linux-mint
  https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

/David Engdal, 2014-03-04
