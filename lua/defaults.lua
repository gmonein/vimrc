vim.diagnostic.config({
  virtual_text = true,   -- Affiche le texte du diagnostic directement dans le buffer
  signs = true,          -- Conserve les signes dans la colonne de gauche
  underline = true,     -- Désactive le soulignement des lignes
  update_in_insert = false, -- Ne met pas à jour les diagnostics en mode insert
  severity_sort = true,  -- Trie les diagnostics par gravité
})

vim.opt.shell = "zsh"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.breakindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.modifiable = true
vim.opt.number = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~') .. "/.vim-undo/"

vim.opt.dir = "/tmp/"

vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand('~') .. '/.vim-backup/'

vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>')
vim.keymap.set('n', '<Tab>', ':tabnext<CR>')

vim.keymap.set('n', '<leader>vrc', ':tabnew<CR>:e ~/.config/nvim/lua/<CR>')
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

vim.keymap.set('n', '<C-p', '<C-i>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hf', '"pyyi<C-c>hvim <C-\\><C-n>"ppi<CR>')

vim.cmd("command! W w")
vim.filetype.add({ extension = { arb = "ruby" } })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "eruby.javascript",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
  end,
})
