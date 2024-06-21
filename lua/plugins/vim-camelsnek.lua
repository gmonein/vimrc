return {{
  "nicwest/vim-camelsnek",
  config = function()
    vim.keymap.set('n', '<leader>sn', ':Snek<CR>')
    vim.keymap.set('n', '<leader>cm', ':Camel<CR>')
    vim.keymap.set('n', '<leader>cb', ':CamelB<CR>')
    vim.keymap.set('n', '<leader>kb', ':Kebab<CR>')
  end
}}
