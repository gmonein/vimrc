set nocompatible " be iMproved
set rtp+=~/.config/nvim/bundle/Vundle.vim
set tags=~/.vim/tags

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
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
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
Plugin 'kmurph73/vim_html_to_haml.git'
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

Plugin 'vim-syntastic/syntastic'
Plugin 'sjl/gundo.vim'

call vundle#end()
colorscheme gruvbox
set background=dark
syntax on
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff

let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

let current_compiler = "gcc"

let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra -I include -I include/ui'
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
" let g:ale_fixers = {'ruby': ['rubocop']}
let g:airline#extensions#ale#enabled = 1
let g:fzf_action = { 'T': 'tab split', 'S': 'split', 'V': 'vsplit'}
let mapleader=","
let g:vimrubocop_keymap = 0

let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


nnoremap <leader>vrc  :tabnew ~/.config/nvim/init.vim<CR>
" nmap <Leader>rbc :RuboCop<CR>

" nmap <leader>gv       :exe "normal V" | let temp_var=indent(line(".")) | while indent(line(".")+1) >= temp_var | exe "normal j" | endwhile
inoremap <C-s>        <Esc>:w<CR>i
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
tmap <Esc>            <C-\><C-n>
nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=.js --exclude=log -f .tags<cr>
map <leader>/         <Esc>:noh<CR>
map <leader>t         :bot new<CR>:te<CR>
map <leader>"         csW"
map <leader>'         csW'
map <leader>"'        cs"'
map <leader>'"        cs'"
nmap <leader>c        Vgc
nmap <leader>k        :set list!<CR>
nnoremap <Leader>f    :Files<CR>
nnoremap <Leader>b    :Buffers<CR>
nnoremap <leader>l    :BLines<CR>
vnoremap //           y/<C-R>"<CR>

tnoremap <leader>pls  ls -d ${PWD}/*<CR>
tnoremap <leader>1pls ls -1 -d ${PWD}/*<CR>
" nnoremap <leader>pvrc  :! sh ~/vimrc/push_vimrc.sh<CR>

inoremap jj           <esc>
inoremap jk           <esc>
inoremap kj           <esc>
tnoremap jj           <esc>
tnoremap jk           <esc>
tnoremap kj           <esc>

inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

noremap <leader>sb   :let saved_buffer_nr = bufnr('%')<CR>
noremap <leader>ob   :exec 'b' saved_buffer_nr<CR>
noremap <leader><leader> ,

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set incsearch
set splitright
set splitbelow
set ignorecase

set splitright
set splitbelow

set hlsearch
set smartcase

set cursorline

set noswapfile

set number
set relativenumber

set backspace=2

set expandtab
set tabstop=2

set modifiable

set clipboard=unnamed
set lazyredraw

set re=1

set hidden
set undodir=~/.vim-undo/

command! W w
set viminfo+=n~/.vim/viminfo

autocmd BufNewFile,BufRead *.ruby 
autocmd BufNewFile,BufRead *.rb set shiftwidth=2|set softtabstop=2|set tabstop=2
autocmd BufNewFile,BufRead *.haml set shiftwidth=2|set tabstop=2|set softtabstop=2
autocmd BufNewFile,BufRead *.scss set shiftwidth=2|set tabstop=2|set softtabstop=2
autocmd BufNewFile,BufRead *.c set shiftwidth=4|set tabstop=4|set softtabstop=4

autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
autocmd TermOpen * setlocal scrollback=2000

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

let g:fzf_layout = { 'left': '~20%' }
let g:rg_command = '
        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
        \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
        \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
