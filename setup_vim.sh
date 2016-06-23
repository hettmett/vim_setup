#!/bin/bash

# install git
echo 'Installing git library...'
sudo yum install git
sudo yum install the_silver_searcher
echo 'Done'

# install vundle from git
if [[ ! -e ~/.vim/bundle/vundle/.git ]]
then
    echo 'Installing vundle bundle...'
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    echo 'Done'
fi

# checkout vim config files
if [[ ! -e ~/vim_conf/.git ]]
then
    echo 'Installing hett vim configs...'
    git clone https://github.com/hettmett/vim_conf.git ~/vim_conf
    echo 'Done'
fi

# copy color file
if [[ ! -e ~/.vim/colors/quagmire.vim ]]
then
    mkdir ~/.vim/colors
    cp ~/vim_conf/quagmire.vim ~/.vim/colors/quagmire.vim
    cp ~/vim_conf/nofrils-dark.vim ~/.vim/colors/nofrils-dark.vim
fi

# copy .vimrc file
if [[ ! -e ~/.vimrc ]]
then
    cp ~/vim_conf/vimrc ~/.vimrc

    echo 'Installing vim bundles...'
    vim +BundleInstall +qall
    echo 'Done'

    echo 'Creating swap/backup/undo directories'
    mkdir ~/.vim/swap
    mkdir ~/.vim/backup
    mkdir ~/.vim/undo
    echo 'Done'
fi

echo 'Enjoy'
