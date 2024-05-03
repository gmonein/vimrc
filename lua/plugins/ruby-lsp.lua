return {{
  'mihyaeru21/nvim-ruby-lsp',
  requires = 'neovim/nvim-lspconfig',
  config = {
    default_config = {
      cmd = { "bundle", "exec", "ruby-lsp" },
      filetypes = { "ruby" },
      init_options = {
        enabledFeatures = {
          "documentHighlights",
          "documentSymbols",
          "foldingRanges",
          "selectionRanges",
          "formatting",
          "codeActions",
        },
      },
      settings = {},
    },
    commands = {
      FormatRuby = {
        function()
          vim.lsp.buf.format({
            name = "ruby_lsp",
            async = true,
          })
        end,
        description = "Format using ruby-lsp",
      },
    },
  }
}}
