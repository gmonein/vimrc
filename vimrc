set nocompatible
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let sbv_open_nerdtree_to_start=0
let sbv_open_nerdtree_with_new_tab=0
let sbv_display_placeholder=0
let sbv_tab_placeholder='»·'
let sbv_space_placeholder='·'
let sbv_smart_shortcut=1
let sbv_indentation_type="tab"
let sbv_indentation_length=4
let sbv_enable_numbers=1

let g:tube_terminal = "xterm"
let current_compiler = "gcc"
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = ['../../../include', '../../include','../include','./include']
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1

call pathogen#infect()
call pathogen#helptags()
colorscheme gruvbox

set hlsearch
set encoding=utf-8
set ai
set nu
set cc=80
set t_Co=256
set cursorline
set whichwrap+=<,>,h,l,[,]
hi CursorLine term=bold cterm=bold guibg=Grey40
set splitright
set autochdir
set backspace=indent,eol,start

execute "set tabstop=". sbv_indentation_length
execute "set shiftwidth=". sbv_indentation_length
execute "set softtabstop=". sbv_indentation_length
noremap <S-Tab>				:tabprevious<CR>
noremap <Tab>				:tabnext<CR>
inoremap jk				<Esc>
vnoremap ,				<Esc>

noremap <S-l>				<C-w><Right>
noremap <S-h>				<C-w><Left>
noremap <S-k>				<C-w><Up>
noremap <S-j>				<C-w><Down>
noremap +		:vertical resize +3<CR>
noremap -		:vertical resize -3<CR>

syntax on
	execute "set list listchars=tab:". sbv_tab_placeholder .",trail:". sbv_space_placeholder
let g:enable_numbers = sbv_enable_numbers
