return {{
  'prettier/vim-prettier',
  config = function()
    vim.keymap.set('n', '<leader>p', ':Prettier<CR>')
    vim.keymap.set('v', '<leader>p', ':PrettierFragment<CR>')
    vim.g.prettier_quickfix_enabled = 0
    vim.g.prettier_autoformat = 0
    vim.g.prettier_autoformat_require_pragma = 0
    vim.g.prettier_autoformat_config_files = { '.prettierrc' }

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.scss", "*.md" },
      callback = function()
        vim.b.prettier_exec_cmd = "prettier"
        -- vim.cmd([[ silent Prettier ]])
      end
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {"*.css", "*.scss"},
      callback = function()
        vim.b.prettier_exec_cmd = "prettier-stylelint"
      end,
    })
  end
}}
