-- Define a user command to toggle the variable
vim.api.nvim_create_user_command('FormatToggle', function()
    vim.g.autoformat = not vim.g.autoformat
    local status = vim.g.autoformat and 'ON' or 'OFF'
    print(string.format('Autoformat-on-save %s', status))
end, {})

return {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
        lazy = true,
        formatters_by_ft = {
            lua = { 'stylua', lsp_format = 'fallback' },
            python = { 'ruff_organize_imports', 'ruff_format', lsp_format = 'fallback' },
            rust = { 'rustfmt', lsp_format = 'fallback' },
        },
        format_on_save = function(bufnr)
            if vim.g.autoformat or vim.b[bufnr].autoformat then
                return { timeout_ms = 500, lsp_format = 'fallback' }
            end
        end,
    },
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            desc = 'Format buffer',
        },
        { '<leader>uf', '<cmd>FormatToggle<cr>', desc = 'Toggle autoformat-on-save' },
    },
}
