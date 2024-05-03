local function reloadConfigWithPath()
    local currentBufferPath = vim.fn.expand('%:p')
    ReloadConfig(currentBufferPath)
end

vim.api.nvim_set_keymap('n', '<leader>rc', '<cmd>lua reloadConfigWithPath()<CR>', {noremap = true, silent = true})
