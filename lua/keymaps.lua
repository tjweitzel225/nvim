local map = vim.keymap.set

map({ 'i', 'v' }, 'jk', '<Esc>')
map({ 'i', 'v' }, 'kj', '<Esc>')

map('n', '<esc>', ':noh<cr><esc>', { silent = true, noremap = true })
map('n', '<leader>q', ':q<cr>', { desc = 'Close window', silent = true, noremap = true })

map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader>cr', function()
    vim.lsp.buf.rename()
end, { desc = 'Rename symbol' })

map('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code action' })

local jump_to_diagnostic = function(count)
    vim.diagnostic.jump { count = count, float = true }
end
map('n', ']d', function()
    jump_to_diagnostic(1)
end, { desc = 'Jump to next diagnostic' })
map('n', '[d', function()
    jump_to_diagnostic(-1)
end, { desc = 'Jump to previous diagnostic' })
map('n', ']D', function()
    jump_to_diagnostic(math.huge)
end, { desc = 'Jump to last diagnostic' })
map('n', '[D', function()
    jump_to_diagnostic(-math.huge)
end, { desc = 'Jump to first diagnostic' })
