" File encodings
set encoding=utf-8
scriptencoding utf-8
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
set colorcolumn=80

" Tab behavior
set expandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2

" Dictionary and Spelling
set spell spelllang=en_us
set dictionary+=/usr/share/dict/words

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
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'morhetz/gruvbox'
  Plug 'mkitt/tabline.vim'
  Plug 'tpope/vim-obsession'
  Plug 'junegunn/goyo.vim'
  Plug 'nelstrom/vim-visual-star-search'
call plug#end()

" NERDTree Configuration
nnoremap <leader>f :NERDTreeToggle<CR>

" Source this file shortcut
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>o :tab drop ~/.config/nvim/init.vim<CR>

" Fuzzy finder configuration
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" Override rg so it won't search by filename
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
noremap <c-p> :FZF<CR>
noremap <c-s> :Rg<CR>

" Neomake to run every write and read
call neomake#configure#automake('rw', 1000)

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
 
" Additional UI configuration
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set bg=dark
highlight VertSplit gui=NONE cterm=NONE
highlight clear SignColumn
highlight Comment gui=italic cterm=italic

if has('nvim') && has('multi_byte')
  set fillchars=vert:\│,eob:\ 
endif
