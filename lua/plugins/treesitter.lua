return {{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "html",
        "vim",
        "javascript",
        "typescript",
        "prisma",
        "tsx",
        "ruby",
        "json",
        "graphql",
        "css",
        "scss",
        "angular"
      },
    })
  end
}}
