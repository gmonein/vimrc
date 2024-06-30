return {{
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "tsserver", "prismals", "solargraph", "efm", "standardrb" }
    })

    require("lspconfig").tsserver.setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'v:lua.vim.lsp.omnifunc')
      end
    })
    require("lspconfig").solargraph.setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        solargraph = {
          diagnostics = true
        }
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'v:lua.vim.lsp.omnifunc')
      end
    })
    require("lspconfig").ruby_lsp.setup()
    require("lspconfig").efm.setup({
      init_options = {documentFormatting = true},
      filetypes = { 'ruby' },
      settings = {
        rootMarkers = {".git/"},
        languages = {
          lua = {
            {formatCommand = "lua-format -i", formatStdin = true}
          },
          languages = {
            ruby = {
              lintCommand = 'rubocop --format emacs --force-exclusion --stdin ${INPUT} 2>/dev/null',
              lintStdin = true,
              lintFormats = { '%f:%l:%c: %m' },
              formatCommand = 'rubocop -a --stdin ${INPUT} 2>/dev/null',
              formatStdin = true
            }
          }
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

    local cmp = require('cmp')
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp. mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Down>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Up>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "dotenv" },
        { name = 'vsnip' }
      }, {
        { name = 'buffer' }
      }
    }
  end
}}
