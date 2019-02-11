set nocompatible " be iMproved
set tags=~/tags; " Set tags directory
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'JamshedVesuna/vim-markdown-preview'
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
" Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'morhetz/gruvbox'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/deoplete.nvim'
Plugin 'kchmck/vim-coffee-script'
call vundle#end()

colorscheme gruvbox
set background=dark
syntax on
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff

" let vim_markdown_preview_github=1
let current_compiler = "gcc"
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra -I include -I include/ui -I .'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_include_dirs = ['./', '../../../includes', '../../includes','../includes', 'includes', './libft/includes', '../libft/includes', '../../libft/includes', '/includes', '']
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = ['./', '../../../includes', '../../includes','../includes', 'includes', './libft/includes', '../libft/includes', '../../libft/includes', '/includes', '']

let sbv_open_nerdtree_to_start=0
let g:deoplete#enable_at_startup = 1
let sbv_open_nerdtree_with_new_tab=0
let g:solarized_termcolors=256
let g:ale_fixers = {'ruby': ['rubocop']}
let g:airline#extensions#ale#enabled = 1
let g:fzf_action = { 'T': 'tab split', 'S': 'split', 'V': 'vsplit'}
let mapleader=","

" nmap <leader>gv       :exe "normal V" | let temp_var=indent(line(".")) | while indent(line(".")+1) >= temp_var | exe "normal j" | endwhile
nnoremap <C-s>        :w<CR>
nnoremap <S-Tab>      :tabprevious<CR>
noremap <Tab>         :tabnext<CR>
noremap <S-l>         <C-w><Right>
noremap <S-h>         <C-w><Left>
noremap <S-k>         <C-w><Up>
noremap <S-j>         <C-w><Down>
noremap <C-l>         :vertical resize +3<CR>
noremap <C-h>         :vertical resize -3<CR>
noremap <C-j>         <C-w>-
noremap <C-k>         <C-w>+
nnoremap <Tab>        :tabnext<CR>
nnoremap <Shift><Tab> :tabprevious<CR>
tmap <C-h>            <Left>
tmap <C-j>            <Down>
tmap <C-k>            <Up>
tmap <C-l>            <Right>
tmap <leader>eo       <C-c>reload!<CR>
nmap <leader>eo       :te<CR>irails c<CR><esc>
tmap <leader>ei       <C-c>reload!<CR><Up><Up><CR>
nmap <leader>ei       :te<CR>irails c<CR><Up><CR>
tmap <Esc>            <C-\><C-n>
map <leader>/         <Esc>:noh<CR>
map <leader>T         :sp<CR>:te<CR>
map <leader>t         :bot new<CR>:te<CR>
map <leader>C         <leader>Tirails c<CR>
map <leader>c         <leader>tirails c<CR>
nnoremap <leader>vrc  :tabnew ~/.config/nvim/init.vim<CR>
nmap <leader>rr       :te<CR>irails routes<CR>
nmap <leader>rb       :bot<CR>:te<CR>irails routes<CR>
nmap <leader>rrt      :tabnew<CR>:te<CR>irails routes<CR>
map <leader>"         csW"
map <leader>'         csW'
map <leader>"'        cs"'
map <leader>'"        cs'"
nmap <leader>k        :set list!<CR>
nmap <leader>f        :vimgrep
nnoremap <Leader>f    :Files<CR>
nnoremap <Leader>b    :Buffers<CR>
nnoremap <leader>l    :BLines<CR>
vnoremap //           y/<C-R>"<CR>
tnoremap <leader>pls  ls -d ${PWD}/*<CR>
tnoremap <leader>1pls ls -1 -d ${PWD}/*<CR>
nnoremap <leader>pvrc  :! sh ~/vimrc/push_vimrc.sh<CR>

inoremap jj           <esc>
inoremap jk           <esc>
inoremap kj           <esc>
tnoremap jj           <esc>
tnoremap jk           <esc>
tnoremap kj           <esc>

inoremap fj           <esc>
inoremap jf           <esc>

" Don't be a noob, join the no arrows key movement
" inoremap <Up>       <NOP>
" inoremap <Down>     <NOP>
" inoremap <Left>     <NOP>
" inoremap <Right>    <NOP>
" noremap <Up>        <NOP>
" noremap <Down>      <NOP>
" noremap <Left>      <NOP>
" noremap <Right>     <NOP>
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

" noremap <Leader>y   "*y
" noremap <Leader>p   "*p
" noremap <Leader>Y   "+y
" noremap <Leader>P   "+p
" nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

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

autocmd BufNewFile,BufRead *.c set shiftwidth=4|set softtabstop=0|set noexpandtab
" autocmd BufNewFile,BufRead *.ruby set shiftwidth=2
" autocmd BufNewFile,BufRead *.ruby set tabstop=2
" autocmd BufNewFile,BufRead *.ruby set softtabstop=2
" autocmd BufNewFile,BufRead *.rb set shiftwidth=2
" autocmd BufNewFile,BufRead *.rb set softtabstop=2
" autocmd BufNewFile,BufRead *.rb set tabstop=2
" autocmd BufNewFile,BufRead *.haml set shiftwidth=2
" autocmd BufNewFile,BufRead *.haml set tabstop=2
" autocmd BufNewFile,BufRead *.haml set softtabstop=2
" autocmd BufNewFile,BufRead *.scss set shiftwidth=2
" autocmd BufNewFile,BufRead *.scss set tabstop=2
" autocmd BufNewFile,BufRead *.scss set softtabstop=2
" autocmd BufNewFile,BufRead *.coffee set syntax=coffee

" set autocompletion when CTRL-P or CTRL-N are used.
" It is also used for whole-line
" . ... scan the current buffer
" b ... scan other loaded buffers that are in the buffer list
" w ... buffers from other windows
" u ... scan unloaded buffers that are in the buffer list
" U ... scan buffers that are not in the buffer list
" ] ... tag completion
" i ... scan current and included files
set complete=i,.,b,w,u,U,]

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
 let g:neocomplete#force_omni_input_patterns = {}
endif

"""""""""""""""""""""""""""""""""""                    Fuzzy finder!                   """""""""""""""""""""""""""""""""

let g:fzf_layout = { 'left': '~20%' }
let g:rg_command = '
        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
        \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
        \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
