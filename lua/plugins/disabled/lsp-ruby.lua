return {{
  'mihyaeru21/nvim-ruby-lsp',
  dependencies = 'neovim/nvim-lspconfig',
  opts = {
    default_config = {
      cmd = { "ruby-lsp" },
      formatter = 'rubyfmt',
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
  }
}}
