return {{
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      cleanup_delay_ms = 1000000,
      float = {
        padding = 16,
        max_width = 64
      }
    })

    vim.keymap.set("n", "<leader>e", function()
      oil.toggle_float(nil)
    end, {})
  end
}}
