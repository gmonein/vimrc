return {{
  'pmizio/typescript-tools.nvim',
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "change",
        expose_as_code_action = { "add_missing_imports", "remove_unused_imports", "organize_imports" },
        tsserver_path = nil,
        tsserver_plugins = {},
        tsserver_max_memory = "auto",
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        tsserver_locale = "en",
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        -- CodeLens
        -- possible values: ("off"|"all"|"implementations_only"|"references_only")
        code_lens = "off",
        -- by default code lenses are displayed on all referencable values and for some of you it can
        -- be too much this option reduce count of them by removing member references from lenses
        disable_member_code_lens = true,
        -- JSXCloseTag
        -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
        -- that maybe have a conflict if enable this feature. )
        jsx_close_tag = {
          enable = false,
          filetypes = { "javascriptreact", "typescriptreact" },
        }
      },
    }
  end,
}}
