require'lspconfig'.solargraph.setup{
  cmd = { "asdf", "exec", "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = require('lspconfig/util').root_pattern("Gemfile", "."),
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}
