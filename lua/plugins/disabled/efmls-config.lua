return {{
  'creativenull/efmls-configs-nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function()
    local eslint = require('efmls-configs.linters.eslint')
    local prettier = require('efmls-configs.formatters.prettier')
    local stylua = require('efmls-configs.formatters.stylua')
    local reek = require('efmls-configs.formatters.reek')
    local languages = {
      typescript = { eslint, prettier },
      lua = { stylua },
      ruby = { reek }
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { '.git/' },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }
  end
}}
