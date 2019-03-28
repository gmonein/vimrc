set nocompatible " be iMproved
set rtp+=~/.config/nvim/bundle/Vundle.vim
set tags=~/.vim/tags

call vundle#begin("~/.config/nvim/bundle")
  Plugin 'jlanzarotta/bufexplorer'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  " Plugin 'altercation/vim-colors-solarized'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-commentary' 
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-haml'
  Plugin 'tpope/vim-rbenv'
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-projectionist'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'
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
  Plugin 'slashmili/alchemist.vim'
  Plugin 'morhetz/gruvbox'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'Shougo/context_filetype.vim'
  Plugin 'wsdjeg/FlyGrep.vim'
  Plugin 'ludovicchabant/vim-gutentags'
  Plugin 'universal-ctags/ctags'
  Plugin 'wokalski/autocomplete-flow'
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'mbbill/undotree'

  " Plugin 'kmurph73/vim_html_to_haml.git'
  " Plugin 'vim-syntastic/syntastic'
  " Plugin 'neomake/neomake'
  " Plugin 'jiangmiao/auto-pairs'
  " Plugin 'c-brenn/phoenix.vim'
  " Plugin 'elixir-editors/vim-elixir'
  " Plugin 'huffman/vim-elixir'
call vundle#end()

let mapleader=","

let g:loaded_vimrubocop = 0
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard" " soft, medium, hard
let g:gruvbox_contrast_light = "medium"
set t_ut= " fixes transparent BG on tmux
set background=dark
syntax on
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff


"=========================== LINTERS ==============================
  "=> SYNTASTIC
    let current_compiler = "gcc"
    " let g:syntastic_cpp_compiler = 'gcc'
    " let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra -I include -I include/ui'
    " let g:syntastic_check_on_open=1
    " let g:syntastic_enable_signs=1
    " let g:syntastic_cpp_check_header = 1
    " let g:syntastic_cpp_remove_include_errors = 1
    " let g:syntastic_cpp_remove_include_errors = 1
    " let g:syntastic_cpp_include_dirs = ['./', '../../../includes', '../../includes','../includes', 'includes', './libft/includes', '../libft/includes', '../../libft/includes', '/includes', '']
    " let g:syntastic_c_remove_include_errors = 1
    " let g:syntastic_c_include_dirs = ['./', '../../../includes', '../../includes','../includes', 'includes', './libft/includes', '../libft/includes', '../../libft/includes', '/includes', '']
    "
  "=> ALE
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 0
    let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['standard']}

  "=> NEOMAKE
    " call neomake#configure#automake('w')

"=================================================================
"
let sbv_open_nerdtree_to_start=0
let sbv_open_nerdtree_with_new_tab=0

let g:solarized_termcolors=256
let g:fzf_action = { 'T': 'tab split', 'S': 'split', 'V': 'vsplit'}
let g:vimrubocop_keymap = 0

let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1


let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_use_bundler = 1

" to_html settings
let html_number_lines = 1
let html_ignore_folding = 1
let html_use_css = 1
"let html_no_pre = 0
let use_xhtml = 1
let xml_use_xhtml = 1



nnoremap <leader>ut :UndotreeToggle<cr>
set undodir=~/.vim-undo/
set undofile

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

noremap <Right>        :vertical resize +3<CR>
noremap <Left>         :vertical resize -3<CR>
noremap <Down>         <C-w>-
noremap <Up>           <C-w>+

nnoremap <Tab>        :tabnext<CR>
nnoremap <Shift><Tab> :tabprevious<CR>

" tmap <C-h>            <Left>
" tmap <C-j>            <Down>
" tmap <C-k>            <Up>
" tmap <C-l>            <Right>

imap <leader>' <<C-A>echo "\n" ; <C-e><CR>
tmap <Esc>            <C-\><C-n>

nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=.js --exclude=log -f .tags<cr>

map <leader>/         <Esc>:noh<CR>

nnoremap <leader>q    @q

map <leader>t         :bot new<CR>:te<CR>zsh --login<CR>rvm use 2.6.1<CR>
map <leader>it        :te<CR>izsh --login<CR>rvm use 2.6.1<CR>
map <leader>"         csW"
map <leader>'         csW'
map <leader>"'        cs"'
map <leader>'"        cs'"
nmap <leader>c        Vgc
nmap <leader>k        :set list!<CR>
nnoremap <leader>vg   :FlyGrep<cr>
vnoremap //           y/<C-R>"<CR>
vnoremap <leader>ga   y<esc>igit add <esc>p
nmap    <leader>wrk   :tabnew<CR>:ter<CR>:f wrk<CR>issh deployer@intra-worker3.42.fr -p 4222 -oStrictHostKeyChecking=no<CR>cd /home/deployer/intra/profile/current && RAILS_ENV=production bundle exec ./bin/rails c<CR>
nmap    <leader>api   :tabnew<CR>:ter<CR>:f apiii<CR>issh deployer@intra-worker5.42.fr -p 4222 -oStrictHostKeyChecking=no<CR>cd /home/deployer/intra/api/current && RAILS_ENV=production bundle exec ./bin/rails c<CR>
nmap    <leader>con   :tabnew<CR>:ter<CR>:f con<CR>icd ~/intra/profile<CR>zsh --login<CR>./bin/rails c<CR>
tmap    <leader>mep   git stash ; git checkout origin/master -- Gemfile Gemfile.lock ; git pull ; bundle ; bundle update ft_core ; git add Gemfile.lock ; git commit -m 'mep' ; git push origin master ; mep<CR>
nmap    <leader>erg   :tabnew ~/qmk-fromtext/my_keymap.py<CR>:sp<CR>:ter<CR>icd ~/qmk-fromtext<CR>

nnoremap <Leader>f    :Files<CR>
nnoremap <Leader>b    :Buffers<CR>
nnoremap <leader>l    :BLines<CR>

nnoremap <leader>%    %va[<esc>:s/,//g<cr>:s/://g<cr>:noh<cr>f[

tnoremap <leader>pls  ls -d ${PWD}/*<CR>
tnoremap <leader>1pls ls -1 -d ${PWD}/*<CR>
tnoremap jj           <esc>
tnoremap jk           <esc>
tnoremap kj           <esc>
" nnoremap <leader>pvrc  :! sh ~/vimrc/push_vimrc.sh<CR>

inoremap jj           <esc>
inoremap jk           <esc>
inoremap kj           <esc>

noremap <leader>rc   :ter<CR>izsh --login<CR>./bin/rails c<CR>
noremap <leader>sb   :let saved_buffer_nr = bufnr('%')<CR>
noremap <leader>ob   :exec 'b' saved_buffer_nr<CR>
noremap <leader><leader> ,

filetype on
filetype plugin indent on

scriptencoding utf-8

set wildmenu                       " Enhanced completion hints in command line
set backspace=eol,start,indent     " Allow backspacing over indent, eol, & start
set secure
set encoding=utf-8
set termencoding=utf-8
set shell=/bin/zsh
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

set autoindent

command! W w
set viminfo+=n~/.vim/viminfo

autocmd BufNewFile,BufRead *.ruby 
autocmd BufNewFile,BufRead *.rb set shiftwidth=2|set softtabstop=2|set tabstop=2
autocmd BufNewFile,BufRead *.haml set shiftwidth=2|set tabstop=2|set softtabstop=2
autocmd BufNewFile,BufRead *.scss set shiftwidth=2|set tabstop=2|set softtabstop=2
autocmd BufNewFile,BufRead *.c set shiftwidth=4|set tabstop=4|set softtabstop=4
autocmd BufNewFile,BufRead *.js set shiftwidth=4|set tabstop=4|set softtabstop=4

autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
autocmd TermOpen * setlocal scrollback=2000


set complete=i,.,b,w,u,U,]
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000
nnoremap <C-d>       i<C-X><C-O>
inoremap <C-d>       <C-X><C-O>
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"
inoremap <expr><C-h> deoplete#undo_completion()
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,js setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete|let g:rubycomplete_buffer_loading = 1|let g:rubycomplete_rails = 1|let g:rubycomplete_classes_in_global = 1
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes.css = 'scss'
let g:context_filetype#same_filetypes.haml = 'css'

let g:neocomplete#sources#omni#input_patterns = {}
let g:neocomplete#force_omni_input_patterns = {}

let g:fzf_layout = { 'left': '~20%' }
let g:rg_command = '
        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
        \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
        \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
