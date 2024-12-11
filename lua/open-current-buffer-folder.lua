function _G.openCurrentBufferFolder()
  vim.g.currentBufferFile = vim.fn.expand('%');
  vim.g.currentBufferFolder = string.gsub(vim.g.currentBufferFile, "[^/]+$", "/", 1);
  vim.cmd('e' .. vim.g.currentBufferFolder);
end

function _G.openCurrentBufferFolderTer()
  vim.g.currentBufferFile = vim.fn.expand('%');
  vim.g.currentBufferFolder = string.gsub(vim.g.currentBufferFile, "[^/]+$", "/", 1)
  vim.g.currentBufferFolder = string.gsub(vim.g.currentBufferFolder, "oil://", "", 1)
  vim.cmd('ter cd ' .. vim.g.currentBufferFolder .. '; zsh');
end

vim.api.nvim_set_keymap('n', '<Leader>q', ':lua openCurrentBufferFolder()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tq', ':lua openCurrentBufferFolderTer()<CR>', {noremap = true, silent = true})
