vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>')
vim.keymap.set('n', '<Tab>', ':tabnext<CR>')

vim.keymap.set('n', '<leader>vrc', ':tabnew<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>')
vim.keymap.set('n', '<leader>gf', 'F yt::e<C-r>"<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('v', '//', '"sy/<C-R>s<CR>N')
vim.keymap.set('v', 'gc', ':CommentToggle<CR>')

vim.keymap.set('n', '<S-Left>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<S-Right>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<S-Up>', ':resize +3<CR>')
vim.keymap.set('n', '<S-Down>', ':resize -3<CR>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('n', '<C-k>', '<Up>')
vim.keymap.set('t', '<C-k>', '<Up>')

vim.keymap.set('n', '<leader>sb', ":let saved_buffer_nr = bufnr('%')<CR>")
vim.keymap.set('n', '<leader>ob', ":exec 'b' saved_buffer_nr<CR>")

vim.keymap.set('n', '<C-q>', "<C-\\><C-n>:e <C-r>=fnameescape(expand('%:p:h'))<CR>")

vim.keymap.set('n', 'vib', '0vwh"byV/^<C-R>bend<CR>')

vim.keymap.set('n', '<leader>rbf', ':!rubocop --fix %<CR>')

vim.keymap.set('n', '<leader>sg', ':sp | ter cd ~/mjg/AppFrontEnd/ && yarn generate-types')
vim.keymap.set('n', '<leader>sr', ':sp /Users/gaelmonein/mjg/AppFrontEnd/src/@types/graphql.d.ts<CR>:e! %<CR>:bd!<CR>')
vim.keymap.set('n', '<leader>gem', ':tabnew /Users/gaelmonein/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/')

vim.cmd("command! W w")
vim.filetype.add({ extension = { arb = "ruby" } })
