set tags=./tags; " Set tags directory
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

let mapleader=","
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

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
vnoremap //           y/<C-R>"<CR>

command! W w

syntax on
highlight NonText ctermfg=1
highlight SpecialKey ctermfg=10 guifg=#80a0ff

let test#strategy = "neovim"

nmap <leader>sn :Snek<CR>
nmap <leader>cm :Camel<CR>
nmap <leader>cb :CamelB<CR>
nmap <leader>kb :Kebab<CR>

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

"Open current buffer directory
nnoremap <C-q> <C-\><C-n>:e <C-r>=fnameescape(expand('%:p:h'))<CR>

noremap <leader><leader> <leader>

autocmd! BufLeave *#FZF :bd!

nmap <leader>rbf :call RubocopFixFile()<CR>

nmap vib 0vwh"byV/^<C-R>bend<CR>

function! RubocopFixFile()
  exec('!rubocop --autocorrect --disable-uncorrectable ' . @%)
endfunction

function! SearchAndReplaceRg(pattern, replace)
  let files = systemlist('rg -nl "' . a:pattern . '"')
  arg files
  exec('argdo %s/' . a:pattern . '/' . a:replace . '/gce | update')
endfunction

nmap <leader>rg :sp<CR>:ter<CR>irg '<ESC>pi'<CR><ESC>

nmap ,, j:sleep 10ms<CR>j:sleep 10ms<CR>h:sleep 10ms<CR>h:sleep 10ms<CR>h:sleep 10ms<CR>h:sleep 10ms<CR>k:sleep 10ms<CR>k:sleep 10ms<CR>l:sleep 10ms<CR>l:sleep 10ms<CR>l:sleep 10ms<CR>l:sleep 10ms<CR>
