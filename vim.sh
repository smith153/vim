#!/bin/bash


rm .vimrc
ln -s ~/vim/.vimrc  ~/.vimrc
mv .vim .vim_bak
ln -s ~/vim ~/.vim
rsync  -ac --progress .vim_bak/ .vim/

