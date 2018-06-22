set nocompatible " be iMproved
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set tags=./tags; " Set tags directory

au BufNewFile,BufRead *.todo set filetype=todo


let sbv_open_nerdtree_to_start=0
let sbv_open_nerdtree_with_new_tab=0
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rails'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/colorizer'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
"Plugin 'elixir-editors/vim-elixir'
"Plugin 'huffman/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'morhetz/gruvbox'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

colorscheme gruvbox
set background=dark

syntax on
let g:solarized_termcolors=256
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff
let mapleader=","

inoremap jj         <esc>
noremap <S-Tab>    :tabprevious<CR>
noremap <Tab>      :tabnext<CR>

"move between window
noremap <S-l>       <C-w><Right>
noremap <S-h>       <C-w><Left>
noremap <S-k>       <C-w><Up>
noremap <S-j>       <C-w><Down>

"resize window
noremap <C-l>   :vertical resize +3<CR>
noremap <C-h>   :vertical resize -3<CR>
noremap <C-j>   <C-w>-
noremap <C-k>   <C-w>+

"search selection
vnoremap //     y/<C-R>"<CR>

nmap <leader>l :set list!<CR>
nmap <leader>k :set nolist!<CR>
nmap <leader>f :vimgrep
map <leader>s csW'
map <leader>" csW"
map <leader>' csW'
map <leader>"' cs"'
map <leader>c gc
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>f :Files<CR>
nnoremap <Tab> :tabnext<Return>
nnoremap <Shift><Tab> :tabprevious<Return>
inoremap <Tab>   
:tnoremap <Esc> <C-\><C-n>

" Don't be a noob, join the no arrows key movement
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
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

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

autocmd VimEnter * set list lcs=tab:·\
autocmd VimEnter * set list lcs=tab:·\
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

let g:ale_fixers = {'ruby': ['rubocop']}

let g:airline#extensions#ale#enabled = 1

set modifiable

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>
set clipboard=unnamed
if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
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
autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2