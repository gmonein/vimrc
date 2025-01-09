return {{
  "hrsh7th/nvim-cmp",
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    { 'L3MON4D3/LuaSnip', run = "make install_jsregexp" },
    "hrsh7th/nvim-cmp",
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
    local luasnip = require('luasnip')

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
