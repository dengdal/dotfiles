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
echo '. .dotfiles/dotbash/.bashrc.user' >> .bashrc
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    echo 'Installing for Mac OS X, Darwin'
    echo '# to load normal .bashrc in osx as a new osx terminal uses the .bash_profile instead (login shell)' >> .bash_profile;
    echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> .bash_profile;
    echo '# load aliases' >> .bash_profile;
    echo 'if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi' >> .bash_profile;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    echo 'Installing for Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    echo 'Installing for MINGW32_NT'
fi
git config --global core.excludesfile .gitignore_global
