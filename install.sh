#! /bin/bash

move_and_link() {
FILE=$1
LINK=$2

if [ -f $LINK ]; # backup if a file
then
	mv -f $LINK $LINK.old
	echo "Old file $LINK moved to $LINK.old";
fi
ln -sf $FILE $LINK
}

cd
move_and_link .dotfiles/.vim/vimrc .vimrc
move_and_link .dotfiles/.vim .vim
move_and_link .dotfiles/dotgit/.gitignore_global .gitignore_global
move_and_link .dotfiles/dotbash/.bash_aliases .bash_aliases
cat .dotfiles/dotbash/.bashrc.user >> .bashrc
git config --global core.excludesfile .gitignore_global
