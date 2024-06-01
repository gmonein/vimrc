function camelToUnderscore(camelCasedWord)
    local underscoredWord = camelCasedWord:gsub("(%a)([%w_'])", "%1_%2"):lower()
    return underscoredWord
end

function _G.FindGemPath()
    local className = vim.fn.expand('<cword>')
    local gemName = className:gsub('::', '/')
    local command = 'bundle exec gem which ' .. gemName
    local gemPath = vim.fn.system(command)
    print(gemPath)

    gemPath = camelToUnderscore(string.gsub(gemPath, '\n$', ''))
    if gemPath ~= '' then
        vim.cmd('edit ' .. vim.fn.fnameescape(gemPath))
    else
        print("Gem path not found")
    end
end

vim.api.nvim_set_keymap('n', '<leader>gp', ':lua FindGemPath()<CR>', { noremap = true, silent = true })
