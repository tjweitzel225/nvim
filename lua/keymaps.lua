local map = vim.keymap.set

map({ 'i', 'v' }, 'jk', '<Esc>')
map({ 'i', 'v' }, 'kj', '<Esc>')

map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
