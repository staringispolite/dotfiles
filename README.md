dotfiles
========

I lost my dotfiles when my TimeMachine restore failed.

I will rebuild in time. 

Never forget. 


```
git clone https://github.com/staringispolite/dotfiles
ln -s dotfiles/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/altercation/vim-colors-solarized.git
cd vim-colors-solarized/colors
mkdir ~/.vim/colors
mv solarized.vim ~/.vim/colors/
```
