vim.g.autoformat = true
vim.o.autoread = true
vim.o.wrap = false
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
    pattern = '*',
})

-- Trigger checktime when Neovim gains focus, enters a buffer/window, or cursor is idle
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
    pattern = { '*' },
    callback = function()
        if vim.fn.mode() ~= 'c' then -- Only run if not in command mode
            vim.cmd('silent! checktime')
        end
    end,
})

vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.clipboard = 'unnamedplus'
vim.o.winborder = 'rounded'
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.breakindent = true
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.fillchars = {
    fold = ' ', -- character for the fold column filler (the dots/bars)
    foldopen = '▾', -- character for an open fold indicator
    foldclose = '▸', -- character for a closed fold indicator
    foldsep = '│', -- character for the separator line
    eob = ' ', -- character at the end of the buffer (~ symbols)
}
vim.o.foldlevel = 99

vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.confirm = true
vim.o.swapfile = false

vim.cmd('cabbrev h tab h')

vim.diagnostic.config { virtual_lines = false }
vim.diagnostic.config { virtual_text = true }

vim.lsp.inlay_hint.enable(true, { bufnr = 0 })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function()
        local filetype = vim.bo.filetype
        if filetype and filetype ~= '' then
            local success = pcall(function()
                vim.treesitter.start()
            end)
            if not success then
                return
            end
        end
    end,
})
