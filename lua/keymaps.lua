vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>')
vim.keymap.set('n', '<Tab>', ':tabnext<CR>')

vim.keymap.set('n', '<leader>if', ':sp<CR>:ter git diff %<CR>')
vim.keymap.set('n', '<leader>ia', ':sp<CR>:ter git add %<CR>')
vim.keymap.set('n', '<leader>vrc', ':tabnew<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>')
vim.keymap.set('n', '<leader>gf', 'F yt::e<C-r>"<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('v', '//', '"sy/<C-R>s<CR>N')
vim.keymap.set('v', 'gc', ':CommentToggle<CR>')

vim.keymap.set('n', '<C-L>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-H>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<C-J>', ':resize +3<CR>')
vim.keymap.set('n', '<C-K>', ':resize -3<CR>')

vim.keymap.set('n', '<leader>sb', ":let saved_buffer_nr = bufnr('%')<CR>")
vim.keymap.set('n', '<leader>ob', ":exec 'b' saved_buffer_nr<CR>")

vim.keymap.set('n', '<C-q>', "<C-\\><C-n>:e <C-r>=fnameescape(expand('%:p:h'))<CR>")

vim.keymap.set('n', 'vib', '0vwh"byV/^<C-R>bend<CR>')

vim.cmd("command! W w")
