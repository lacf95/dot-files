set termguicolors
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
syntax enable
set number
set splitright
set expandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2
filetype on

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
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'junegunn/goyo.vim'
  Plug 'digitaltoad/vim-jade'
  Plug 'ervandew/supertab'
  Plug 'elixir-lang/vim-elixir'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
call plug#end()

let mapleader=','

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <c-p> :Files<CR>

set t_Co=256
set fillchars=vert:\│,eob:\ 
colorscheme gruvbox
set background=dark

call neomake#configure#automake('nrwi', 500)

nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

au BufNewFile,BufRead *.es6 set filetype=javascript
