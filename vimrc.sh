syntax on
set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8
set smartcase
set smartindent
set noswapfile
set incsearch
set expandtab
set noerrorbells

call plug#begin('~/.vim/plugged')
     Plug 'morhetz/gruvbox'
     Plug 'leafgarland/typescript-vim'
     Plug 'tommason14/lammps.vim'
     Plug 'preservim/nerdtree'
     Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox
set background=dark

" NERDTree shortcut
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeFocus<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
