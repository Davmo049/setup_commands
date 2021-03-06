#!/bin/bash
data_dir="/media/data"
dotfile_dir="${data_dir}/setup_commands/dotfiles"

unlink ~/.vimrc
ln -s $dotfile_dir/vimrc ~/.vimrc
unlink ~/.bashrc_custom
ln -s $dotfile_dir/bashrc_custom ~/.bashrc_custom

unlink ~/.config/nvim/init.vim
ln -s $dotfile_dir/neovim_init ~/.config/nvim/init.vim

##make sure bashrc_custom is sourced
source_to_add="source ~/.bashrc_custom"
grep -q "$source_to_add" ~/.bashrc
if [ ! $? -eq 0 ] ; then
  echo $source_to_add >> ~/.bashrc
fi

unlink ~/.gitconfig
unlink ~/.gitignore
ln -s $dotfile_dir/gitconfig ~/.gitconfig
ln -s $dotfile_dir/gitignore ~/.gitignore

unlink ~/.ssh
ln -s /ssh ~/.ssh
