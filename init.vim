set tags=./tags; " Set tags directory
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
call plug#begin('~/.config/nvim/vim-plug')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-dispatch'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

let g:airline_powerline_fonts = 1

let mapleader=","

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript

" nmap <leader>gv       :exe "normal V" | let temp_var=indent(line(".")) | while indent(line(".")+1) >= temp_var | exe "normal j" | endwhile
nnoremap <S-Tab>      :tabprevious<CR>
noremap <Tab>         :tabnext<CR>
noremap <C-l>         :vertical resize +3<CR>
noremap <C-h>         :vertical resize -3<CR>
noremap <C-j>         <C-w>-
noremap <C-k>         <C-w>+
tmap <C-h>            <Left>
tmap <C-j>            <Down>
tmap <C-k>            <Up>
tmap <C-l>            <Right>
tmap <Esc>            <C-\><C-n>
map <leader>/         <Esc>:noh<CR>
nnoremap <leader>vrc  :tabnew ~/.config/nvim/init.vim<CR>
map <leader>"'        cs"'
map <leader>'"        cs'"
nnoremap <Leader>f    :Files<CR>
nnoremap <Leader>b    :Buffers<CR>
nnoremap <leader>l    :BLines<CR>
vnoremap //           y/<C-R>"<CR>

inoremap jj           <esc>
inoremap jk           <esc>
inoremap kj           <esc>
tnoremap jj           <esc>
tnoremap jk           <esc>
tnoremap kj           <esc>
inoremap fj           <esc>
inoremap jf           <esc>
command! W w

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)
nmap <silent> <Leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev-error)


nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

let sbv_open_nerdtree_to_start=0
let sbv_open_nerdtree_with_new_tab=0

set shell=zsh
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
set shiftwidth=2
set modifiable
set clipboard=unnamedplus

colorscheme gruvbox
set background=dark

syntax on
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff

let test#strategy = "neovim"

if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif

set backupdir^=~/.vim/backup/
set backup

if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory+=~/.vim/swap//
if isdirectory($HOME . '/.vim/undo') == 0
  :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
endif
set undodir=./.vim-undo//
set undodir+=~/.vim/undo//
set undofile

noremap <leader>sb   :let saved_buffer_nr = bufnr('%')<CR>
noremap <leader>ob   :exec 'b' saved_buffer_nr<CR>

noremap <leader><leader> ,

autocmd! BufLeave *#FZF :bd!

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9 } }
let g:rg_command = '
                        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
                        \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
                        \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
inoremap <silent><expr> <Nul> coc#refresh()
nmap <leader>appfront :ter<CR>invm use 15<CR>cd ~/mjg/AppFrontEnd<CR>yarn start-js<CR><ESC>:f appfront_ter<CR>:vsp<CR>:ter<CR>invm use 15; cd ~/mjg/AppFrontEnd; yarn generate-types<CR><ESC>:f appfront_types_ter<CR><ESC>
nmap <leader>account  :ter<CR>invm use 15 ; cd ~/mjg/AccountFrontEnd ; yarn dev<CR><ESC>:f account_ter<CR>
nmap <leader>hermes   :ter<CR>icd ~/mjg/Hermes ; bundle exec rails s<CR><ESC>:f hermes_ter<CR>
nmap <leader>backend  :ter<CR>icd ~/mjg/Backend-API ; bundle exec rails s<CR><ESC>:f backend_ter<CR>
nmap <leader>ruuun :tabnew<CR>,appfront:sp<CR>,account:sp<CR>,hermes:sp<CR>,backend
