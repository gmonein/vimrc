return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup { capabilities = capabilities }
    lspconfig.solargraph.setup({
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git");
      cmd = { 'solargraph', 'stdio' },
      settings = {
        solargraph = {
          diagnostics = false,
          completion = true
        }
      },
    })
    lspconfig.rubocop.setup({
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git");
      cmd = { 'rubocop', '--lsp' },
    })
    lspconfig.eslint.setup({
      cmd = { "vscode-eslint-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
      {
        codeAction = {
          disableRuleComment = { enable = true, location = "separateLine" },
          showDocumentation = { enable = true }
        },
        codeActionOnSave = { enable = true, mode = "all" },
        experimental = { useFlatConfig = false },
        format = false,
        nodePath = "",
        onIgnoredFiles = "off",
        problems = { shortenToSingleLine = false },
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "location"
        }
      }
    })

    vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    })
  end
}}
