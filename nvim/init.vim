" File encodings
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Built-in UX configuration
set t_Co=256
syntax enable
set number
set termguicolors
set splitright
set splitbelow
set cursorline
filetype on

" Tab behavior
set expandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2

call plug#begin('~/.config/nvim/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'bling/vim-airline'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'neomake/neomake'
  Plug 'tpope/vim-endwise'
  Plug 'airblade/vim-gitgutter'
  Plug 'othree/yajs.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'ervandew/supertab'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'herringtondarkholme/yats.vim'
  Plug 'morhetz/gruvbox'
  Plug 'mkitt/tabline.vim'
  Plug 'tpope/vim-obsession'
call plug#end()

" NERDTree Configuration
nnoremap <leader>f :NERDTreeToggle<CR>

" Source this file shortcut
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>o :tabnew ~/.config/nvim/init.vim<CR>

" Fuzzy finder configuration
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
noremap <c-p> :FZF<CR>
noremap <c-s> :Rg<CR>
 
" Additional UI configuration
colorscheme gruvbox
highlight VertSplit gui=NONE cterm=NONE
highlight clear SignColumn

if has('nvim')
  set fillchars=vert:\│,eob:\ 
endif

" Neomake to run everytime
call neomake#configure#automake('nrwi', 500)

" Use Ctrl + K to add new line above current line
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Use Ctrl + J to add new line below current line
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Set tags command
set tags=tags

let g:gutentags_file_list_command = 'rg --files --hidden'

" Use relative numbers on active buffers only
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
