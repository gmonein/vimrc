function _G.WhichClass()
 vim.cmd('sp')
 vim.cmd('ter bundle exec rspec ' .. vim.g.specPath)
end

function _G.RunRspecLine()
 vim.g.specPath = vim.fn.expand('%') .. ':' .. vim.fn.line('.')
 RunSpecPath()
end

function _G.RunRspecFile()
 vim.g.specPath = vim.fn.expand('%')
 RunSpecPath()
end

-- Map keys to call Lua functions
vim.api.nvim_set_keymap('n', '<Leader>rf', ':lua RunRspecFile()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rl', ':lua RunRspecLine()<CR>', {noremap = true, silent = true})
