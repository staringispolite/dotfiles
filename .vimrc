" TAB BEHAVIOR
" Command+t to open new tab
nnoremap <C-t> :tabnew 
" < and > for prevtab and nexttab
nnoremap < gT
nnoremap > gt

" Wrap at beginning and end of lines
set whichwrap+=<,>,h,l,[,]

" Context-insensitive search
:set ignorecase
:set smartcase

" Keep case-insensitivity on * and # matching in search
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Show next match visually
:set incsearch

" Smart indentation
set smartindent

" Tab is 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

