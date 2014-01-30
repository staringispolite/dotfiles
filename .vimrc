""""" PREREQS
" This must be first, because it changes other options as side effect
set nocompatible

" Fix problem where arrow keys inserted new lines with A,B,D
set term=builtin_ansi
set timeout ttimeoutlen=100 timeoutlen=5000

" :q hides a buffer, not closes it. Maintains history, etc.
set hidden

" Change buffer title
set title

" Turn of beeps
set visualbell
set noerrorbells

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Ignore certain files you don't want to edit
set wildignore=*.swp,*.bak,*.pyc,*.class

" History
set history=1000
set undolevels=1000


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

" One of these days I'll turn arrows off.
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

" Show line numbers
set number
set showmatch


""""" INDENTATION
" Smart indentation
set smartindent
set smarttab
set copyindent

" Tab is 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set shiftwidth=2


""""" EXPERIMENTING WITH STILL
" No shift anymore in command mode. Few keystrokes! :w bcomes ;w
nnoremap ; :

" Steve Losh's fix for when you forget to sudo before editing.
" w!! will let you write it anyway.
" http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
cmap w!! w !sudo tee % >/dev/null
