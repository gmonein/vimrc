return {{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local action_layout = require("telescope.actions.layout")
    local actions = require("telescope.actions")
    local additional_rg_args = { "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }

    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["<C-p>"] = action_layout.toggle_preview
          },
          i = {
            ["<C-p>"] = action_layout.toggle_preview
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
            }
          }
        },
        live_grep = { additional_args = additional_rg_args },
        grep_string = { additional_args = additional_rg_args },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    })

    local telescope = require("telescope.builtin")
    require('telescope').load_extension('fzf')

    function _G.search_current_folder()
      local filepath = vim.fn.expand("%:p:h") -- get current buffer's folder
      require("telescope.builtin").find_files({
        cwd = filepath,
        prompt_title = "Search Files in Current Folder",
        hidden = true -- shows hidden files
      })
    end

    vim.keymap.set('n', '<leader>f', telescope.find_files, {})
    vim.keymap.set('n', '<leader>l', telescope.live_grep, {})
    vim.keymap.set('n', '<leader>b', telescope.buffers, {})
    vim.keymap.set("n", "<leader>tf", ":lua search_current_folder()<CR>", { noremap = true, silent = true })
  end
}}
