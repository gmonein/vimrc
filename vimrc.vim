set nocompatible " be iMproved
set rtp+=~/.vim/bundle/Vundle.vim
set tags=./tags; " Set tags directory

call vundle#begin("~/.config/nvim/bundle")
Plugin 'jlanzarotta/bufexplorer'
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/colorizer'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
"Plugin 'elixir-editors/vim-elixir'
"Plugin 'huffman/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'morhetz/gruvbox'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/deoplete.nvim'
Plugin 'kchmck/vim-coffee-script'
call vundle#end()

colorscheme gruvbox
set background=dark
syntax on
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff

let sbv_open_nerdtree_to_start=0
let sbv_open_nerdtree_with_new_tab=0
let g:deoplete#enable_at_startup = 1
let g:solarized_termcolors=256
let g:ale_fixers = {'ruby': ['rubocop']}
let g:airline#extensions#ale#enabled = 1
let g:fzf_action = { 'T': 'tab split', 'S': 'split', 'V': 'vsplit'}
let mapleader=","

noremap <S-Tab>       :tabprevious<CR>
noremap <Tab>         :tabnext<CR>
noremap <S-l>         <C-w><Right>
noremap <S-h>         <C-w><Left>
noremap <S-k>         <C-w><Up>
noremap <S-j>         <C-w><Down>
noremap <C-l>         :vertical resize +3<CR>
noremap <C-h>         :vertical resize -3<CR>
noremap <C-j>         <C-w>-
noremap <C-k>         <C-w>+
nnoremap <Tab>        :tabnext<Return>
nnoremap <Shift><Tab> :tabprevious<Return>
tnoremap <Esc>        <C-\><C-n>
map <leader>t         :sp<Return>:te<Return>
map <leader>T         :vsp<Return>:te<Return>
map <leader>c         <leader>tirails<Space>c<Return>
map <leader>C         <leader>Tirails<Space>c<Return>
map <leader>"         csW"
map <leader>'         csW'
map <leader>"'        cs"'
map <leader>'"        cs'"
nmap <leader>k        :set list!<CR>
nmap <leader>f        :vimgrep
nnoremap <Leader>f    :Files<CR>
nnoremap <Leader>b    :Buffers<CR>
nnoremap <leader>l    :BLines<CR>
inoremap jj           <esc>
inoremap jk           <esc>
inoremap kj           <esc>
inoremap <leader><leader> <esc>
" noremap <Leader>y   "*y
" noremap <Leader>p   "*p
" noremap <Leader>Y   "+y
" noremap <Leader>P   "+p

" Don't be a noob, join the no arrows key movement
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>
"
set incsearch
set splitright
set splitbelow
set ignorecase
set smartcase
set splitright
set splitbelow
set hlsearch
set cursorline
set noswapfile
set number
set backspace=2
set expandtab
set tabstop=2
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set modifiable
set clipboard=unnamed

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif

if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif

set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

set viminfo+=n~/.vim/viminfo
if exists("+undofile")
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

autocmd BufNewFile,BufRead *.ruby set shiftwidth=2
autocmd BufNewFile,BufRead *.ruby set tabstop=2
autocmd BufNewFile,BufRead *.ruby set softtabstop=2
autocmd BufNewFile,BufRead *.rb set shiftwidth=2; set tabstop=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2
autocmd BufNewFile,BufRead *.haml set shiftwidth=2
autocmd BufNewFile,BufRead *.haml set tabstop=2
autocmd BufNewFile,BufRead *.haml set softtabstop=2
autocmd BufNewFile,BufRead *.coffee set syntax=coffee
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""                    Fuzzy finder!                   """""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fzf_layout = { 'left': '~20%' }
let g:rg_command = '
        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
        \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
        \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
