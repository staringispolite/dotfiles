""""" BEGIN VUNDLE SECTION
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" git comments inside vim
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" The Silver Searcher in Vim
"https://github.com/rking/ag.vim
Plugin 'rking/ag.vim'

" Ack in vim
" https://github.com/mileszs/ack.vim
Plugin 'mileszs/ack.vim'

" CTRLP on @mrmrs' recc
" https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

" GUndo - visualize undo history branches
" https://github.com/sjl/gundo.vim
Plugin 'sjl/gundo.vim'

" Vastly improved Javascript indentation and syntax support in Vim
" https://github.com/pangloss/vim-javascript
Plugin 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim
" https://github.com/mxw/vim-jsx
Plugin 'mxw/vim-jsx'

" Typescript syntax highlighting
" https://github.com/leafgarland/typescript-vim
Plugin 'leafgarland/typescript-vim'

" Typescript TSX syntax highlighting that seems inspired by vim-jsx
" https://github.com/ianks/vim-tsx
Plugin 'ianks/vim-tsx'

" Solarized color scheme
" https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""" END VUNDLE SECTION

""""" PREREQS AND MAIN FUNCTIONALITY

" Fix problem where arrow keys inserted new lines with A,B,D
set term=builtin_ansi
set timeout ttimeoutlen=100 timeoutlen=5000

" :q hides a buffer, not closes it. Maintains history, etc.
set hidden

" Turn off beeps
set visualbell
set noerrorbells

" No shift anymore in command mode. Fewer keystrokes! :w bcomes ;w
nnoremap ; :

" No shift anymore to use ag search. Fewer keystrokes!
nnoremap :ag :Ag

" Better split controls
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" Navigate with <C-*> instead of <C-W> *
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change where new splits open. More natural than vim's defaults.
set splitbelow
set splitright

" Quickly edit/reload the vimrc file.
" (<leader> key in vim is \ by default).
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Ignore certain files you don't want to edit
set wildignore=*.swp,*.bak,*.pyc,*.class

" Less lag in screen updates
set ttyfast


""""" History
" Expand how far back to track undos
set history=1000
set undolevels=1000

" Persistent undo 
set undofile
set undodir=~/.vim/undo
set undoreload=10000  " number of lines to save for undo


""""" VISUAL
" Show line numbers
set number
set showmatch

" Change buffer title
set title

" Show line, column numbers at the bottom
set ruler

" get rid of characters in window separators
set fillchars=""

" Always put a status line in, even if there is only one window
set laststatus=2

""""" TAB BEHAVIOR
" Command+t to open new tab
nnoremap <C-t> :tabnew 
" < and > for prevtab and nexttab
"nnoremap < gT
"nnoremap > gt

" Google-Chrome-style tab switching
" with Command+Option+Arrow
nnoremap <ESC>[1;9D gT
nnoremap <ESC>[1;9C gt


""""" MOVEMENT
" Wrap at beginning and end of lines
set whichwrap+=<,>,h,l,[,]

" Scroll before the very beginning/end of the screen.
set scrolloff=8

" Movement keys work on screen lines, not file lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk
nmap <Down> gj
nmap <Up> gk
vmap <Down> gj
vmap <Up> gk

"
" One of these days I'll be cool enough to turn arrows off.
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>


""""" SEARCH
" Context-insensitive search
set ignorecase
set smartcase

" Keep case-insensitivity on * and # matching in search
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Highlight search match, next match
set hlsearch
set incsearch

" Clear search highlighting with esc
nnoremap // :noh<return><esc>

" Creates a quickfix list of all instances of word under the cursor 
nnoremap fj :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>

""""" INDENTATION
" Smart indentation
set smartindent
set smarttab

" Tab is 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab


""""" SYNTAX HIGHLIGHTING
syntax enable
set background=dark
colorscheme solarized
filetype on

" Expand the types that get CSS highlighting
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.sass set filetype=css

" Expand types that get SQL highlighting
au BufNewFile,BufRead *.dump set filetype=sql

" Underline the current line
set cursorline


""""" FOLDING
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END


""""" EXPERIMENTING WITH STILL
" Steve Losh's fix for when you forget to sudo before editing.
" w!! will let you write it anyway.
" http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
cmap w!! w !sudo tee % >/dev/null
