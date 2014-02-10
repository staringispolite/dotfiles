""""" PREREQS AND MAIN FUNCTIONALITY
" This must be first, because it changes other options as side effect
set nocompatible

" Fix problem where arrow keys inserted new lines with A,B,D
set term=builtin_ansi
set timeout ttimeoutlen=100 timeoutlen=5000

" :q hides a buffer, not closes it. Maintains history, etc.
set hidden

" Turn off beeps
set visualbell
set noerrorbells

" No shift anymore in command mode. Few keystrokes! :w bcomes ;w
nnoremap ; :

" Quickly edit/reload the vimrc file
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


""""" TAB BEHAVIOR
" Command+t to open new tab
nnoremap <C-t> :tabnew 
" < and > for prevtab and nexttab
nnoremap < gT
nnoremap > gt


""""" MOVEMENT
" Wrap at beginning and end of lines
set whichwrap+=<,>,h,l,[,]

" Scroll before the very beginning/end of the screen.
set scrolloff=8

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
syntax on
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
