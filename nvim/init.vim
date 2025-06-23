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
set mouse=

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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
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
  Plug 'cormacrelf/vim-colors-github'
  Plug 'elixir-editors/vim-elixir'
  Plug 'digitaltoad/vim-jade'
  Plug 'jvirtanen/vim-hcl'
call plug#end()

" NERDTree Configuration
nnoremap <leader>f :NERDTreeToggle<CR>

" Source this file shortcut
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>o :tab drop ~/.config/nvim/init.vim<CR>
nnoremap <leader>b :Git blame<CR>

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

augroup golang
  autocmd!
  autocmd FileType go setlocal noexpandtab preserveindent copyindent tabstop=4 shiftwidth=4
augroup END

augroup docker
  autocmd!
  autocmd BufNewFile,BufRead *.dockerfile set syntax=dockerfile
augroup END
 
" Additional UI configuration
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set bg=dark
highlight VertSplit gui=NONE cterm=NONE
highlight clear SignColumn
highlight Comment gui=italic cterm=italic

let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline_section_a = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#extensions#xkblayout#status(),0)}%{airline#util#append(airline#parts#iminsert(),0)}'
let g:airline_section_y = ''
let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%2l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#'

if has('nvim') && has('multi_byte')
  set fillchars=vert:\│,eob:\ 
endif
