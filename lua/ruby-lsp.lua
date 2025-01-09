-- return {
--   default_config = {
--     init_options = {
--       enabledFeatures = {
--         "documentHighlights",
--         "documentSymbols",
--         "foldingRanges",
--         "selectionRanges",
--         "formatting",
--         "codeActions",
--       },
--     },
--     settings = {},
--   },
-- }
--
local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup({
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_dir = function(fname)
    return lspconfig.util.root_pattern("Gemfile", ".git", ".")(fname) or vim.fn.getcwd()
  end,
  settings = {
    ruby = {
      enabledFeatures = {
        "codeActions", "diagnostics", "documentFormatting", "hover", "completion",
        "rename", "signatureHelp", "workspaceSymbols"
      }
    }
  },
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  end,
})
