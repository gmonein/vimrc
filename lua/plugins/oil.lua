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

    function _G.refreshCurrentOilBuffer()
      local current_path = vim.api.nvim_buf_get_name(0)

      if not string.match(current_path, "^oil://") then
        print("not an oil buffer")
        return
      end

      local saved_path = current_path

      -- vim.api.nvim_buf_delete(0, {force = true})
      vim.api.nvim_command('enew')

      require('oil.view').delete_hidden_buffers()

      vim.api.nvim_command('edit ' .. saved_path)
    end

    vim.keymap.set("n", "<leader>or", '<cmd>lua refreshCurrentOilBuffer()<CR>')
  end
}}
