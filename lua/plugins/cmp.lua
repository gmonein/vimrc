return {{
  "hrsh7th/nvim-cmp",
  dependencies = {
    'neovim/nvim-lspconfig',
    'saadparwaiz1/cmp_luasnip',
    { 'L3MON4D3/LuaSnip', run = "make install_jsregexp" },
    "hrsh7th/nvim-cmp",
    'hrsh7th/cmp-nvim-lsp',
    'SergioRibera/cmp-dotenv',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'FelipeLema/cmp-async-path',
    { 'tzachar/cmp-fuzzy-buffer', dependencies = { 'tzachar/fuzzy.nvim' } },
    'hrsh7th/cmp-omni',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',
  },
  config = function()
    local cmp = require('cmp')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require('lspconfig')
    local luasnip = require('luasnip')

    lspconfig.lua_ls.setup { capabilities = capabilities }
    lspconfig.solargraph.setup({
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git");
      cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
      settings = {
        solargraph = {
          diagnostics = false,
          completion = true
        }
      },
    })
    lspconfig.rubocop.setup({
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git");
      cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
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

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
          vim.fn["vsnip#anonymous"](args.body)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<Right>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
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
        { name = 'ruby_lsp' },
        { name = 'neodev' },
        { name = 'async_path' },
      }, {
        { name = 'buffer' },
        { name = 'omni' },
        { name = 'cmp-fuzzy-buffer' },
      }
    })
  end
}}
