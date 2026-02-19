set nocompatible              " Required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" --- ADD YOUR PLUGINS HERE ---
Plugin 'flazz/vim-colorschemes'
Plugin 'valloric/youcompleteme'
" -----------------------------

call vundle#end()            " Required
filetype plugin indent on    " Required

" Basic Preferences
syntax on                    " Turn on color highlighting
set number                   " Show line numbers
set mouse=a                  " Enable mouse support
colorscheme colorschemes