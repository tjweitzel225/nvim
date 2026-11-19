local map = vim.keymap.set

map({ 'i', 'v' }, 'jk', '<Esc>')
map({ 'i', 'v' }, 'kj', '<Esc>')

map('n', '<esc>', ':noh<cr><esc>', { silent = true, noremap = true })
map('n', '<leader>q', ':q<cr>', { desc = 'Close window', silent = true, noremap = true })

map('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to split below' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to split above' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })

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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        map('n', 'gd', vim.lsp.buf.definition, {
            buffer = event.buf,
            desc = 'Go to definition',
        })
    end,
})

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

map('n', '<CR>', ':normal van<CR>', {
    desc = 'TS Select: Init Node',
})
map('x', '<CR>', function()
    vim.api.nvim_feedkeys('an', 'v', false)
end, { desc = 'TS Select: Expand Node' })
map('x', '<BS>', function()
    vim.api.nvim_feedkeys('in', 'v', false)
end, { desc = 'TS Select: Shrink Node' })
