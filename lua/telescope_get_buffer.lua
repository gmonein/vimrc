local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Define a custom action to get the buffer ID
local get_buffer_id = function(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    if entry then
        -- Assuming the entry value is the file path
        local bufnr = vim.fn.bufadd(entry.value)
        print("Buffer ID: " .. bufnr)
    end
    actions.close(prompt_bufnr)
end

-- Setup Telescope with the custom action
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-b>"] = get_buffer_id  -- Bind the custom action to Ctrl-b in insert mode
            },
        },
    },
}

-- Optional: Bind a key to launch a specific finder, e.g., find_files
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {noremap = true, silent = true})
