local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.mapleader = ","
vim.g.ruby_host_prog = 'asdf exec neovim-ruby-host'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("defaults")
require("lazy").setup({
  { import = "plugins" }
}, {
  change_detection = {
    enabled = true,
    notify = true
  }
})

require("ruby-heredoc")
require("ruby-runspec")
require("ruby-gemwhich")
require("init-socket")
require("reload-lua")
require("open-current-buffer-folder")
require("run-applications")
require("vim-go")
require("ruby-lsp")
