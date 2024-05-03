return {{
  "numToStr/FTerm.nvim",
  config = function()
    local fterm = require("FTerm")
    vim.keymap.set('n', '<leader><leader>', function() fterm.toggle() end, {})
  end
}}
