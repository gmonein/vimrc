function _G.reloadAndRunLua()
    if vim.bo.filetype == 'lua' then
        require('plenary.reload').reload_module('%')
        vim.cmd('luafile %')
    end
end
vim.api.nvim_set_keymap('n', '<leader>rl', '<cmd>lua reloadAndRunLua()<CR>', { noremap = true, silent = true })
