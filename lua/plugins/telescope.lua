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
        }
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
    vim.keymap.set('n', '<leader>f', telescope.find_files, {})
    vim.keymap.set('n', '<leader>g', telescope.live_grep, {})
    vim.keymap.set('n', '<leader>b', telescope.buffers, {})
  end
}}
