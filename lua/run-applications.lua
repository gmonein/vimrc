function _G.is_buffer_open(buffer_name)
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) then  -- Check if the buffer is loaded
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match(buffer_name) then  -- Match the buffer name
        return true
      end
    end
  end
  return false
end

function _G.runApplications()
  vim.cmd("tabnew")
  vim.cmd("tabmove 0")

  local applications = {
    { name = 'marketplace_backend_ter', path = '~/mjg/Hermes/', command = 'bundle exec rails s' },
    { name = 'marketplace_frontend_ter', path = '~/mjg/AppFrontEnd/', command = 'yarn dev' },
    { name = 'vocation_backend_ter', path = '~/mjg/Backend-API/', command = 'kill_backend; bundle exec rails s' },
    { name = 'vocation_frontend_ter', path = '~/mjg/SelfServiceFrontEnd/', command = 'yarn dev' },
    { name = 'account_frontend_ter', path = '~/mjg/AccountFrontEnd/', command = 'yarn start' },
  }

  for i,application in ipairs(applications) do
    if i ~= 1 then
      vim.api.nvim_input(":sp<CR>")
    end
    if is_buffer_open(application.name) then
      vim.api.nvim_input(":bd! "..application.name.."<CR>")
    end
    vim.api.nvim_input(":terminal<CR>")
    vim.api.nvim_input('acd '..application.path..'<CR>')
    vim.api.nvim_input(application.command..'<CR><ESC>')
    vim.api.nvim_input(":f "..application.name..'<CR>')
  end
end

vim.api.nvim_set_keymap('n', '<Leader>rr', ':lua runApplications()<CR>', {noremap = true, silent = true})
