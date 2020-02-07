#!/bin/bash

# install git
echo 'Installing git library...'
sudo dnf install git
echo 'Done'

echo 'Installing ag search library...'
sudo dnf install the_silver_searcher
echo 'Done'

# install vim-plug
if [[ ! -e ~/.vim/bundle/vundle/.git ]]
then
    echo 'Installing vim-pug...'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
if [[ ! -e ~/.vim/colors ]]
then
    mkdir ~/.vim/colors
    cp ~/vim_conf/*.vim ~/.vim/colors/
fi

# copy .vimrc file
if [[ ! -e ~/.vimrc ]]
then
    cp ~/vim_conf/vimrc ~/.vimrc

    cp ~/vim_conf/plugins.vim ~/.vim/plugins.vim
    cp ~/vim_conf/settings.vim ~/.vim/settings.vim
    cp ~/vim_conf/mappings.vim ~/.vim/mappings.vim
    cp ~/vim_conf/plugins_config.vim ~/.vim/plugins_config.vim
    cp -r ~/vim_conf/pydoc_templates ~/.vim/

    echo 'Installing vim plugins...'
    vim +PlugInstall +qall
    echo 'Done'

    echo 'Updating vim plugins...'
    vim +PlugUpdate +qall
    echo 'Done'
fi

echo 'Enjoy'
