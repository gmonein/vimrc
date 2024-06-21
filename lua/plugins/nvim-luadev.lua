return { 
  'bfredl/nvim-luadev',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>ld', '<Plug>(Luadev-RunLine)', { noremap = false })
    vim.api.nvim_set_keymap('x', '<leader>lf', '<Plug>(Luadev-Run)', { noremap = false })
    vim.api.nvim_set_keymap('n', '<leader>lw', '<Plug>(Luadev-RunWord)', { noremap = false })
    vim.api.nvim_set_keymap('i', '<C-x><C-l>', '<Plug>(Luadev-Complete)', { noremap = false })
  end
}
