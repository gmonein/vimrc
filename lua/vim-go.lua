local lspconfig = require("lspconfig")
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
}

vim.g.go_fmt_command = "gopls"
vim.g.go_imports_autosave = 1
vim.g.go_mod_fmt_autosave = 1
vim.g.go_def_mapping_enabled = 0

require("dap-go").setup()
local dap = require("dap")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        -- LSP-related shortcuts
        local opts = { noremap = true, silent = true, buffer = 0 }
        vim.keymap.set("n", "<leader>rt", ":GoTest<CR>", opts)
        vim.keymap.set("n", "<leader>rf", ":GoTestFile<CR>", opts)
        vim.keymap.set("n", "<leader>rr", ":GoRun<CR>", opts)
        
        -- Debugging shortcuts
        vim.keymap.set("n", "<F5>", function() dap.continue() end, opts)
        vim.keymap.set("n", "<F10>", function() dap.step_over() end, opts)
        vim.keymap.set("n", "<F11>", function() dap.step_into() end, opts)
        vim.keymap.set("n", "<F12>", function() dap.step_out() end, opts)
        vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
        vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, opts)
    end,
})
