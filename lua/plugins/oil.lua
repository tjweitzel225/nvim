return {
    'stevearc/oil.nvim',
    opts = { skip_confirm_for_simple_edits = true },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    keys = {
        {
            '<leader>e',
            function()
                local oil = require('oil')
                if vim.w.is_oil_win then
                    oil.close()
                else
                    oil.open_float(nil, { preview = { vertical = true } })
                end
            end,
            desc = 'Open Oil',
        },
        {
            '<leader>E',
            function()
                local oil = require('oil')
                if vim.w.is_oil_win then
                    oil.close()
                else
                    oil.open_float('.', { preview = { vertical = true } })
                end
            end,
            desc = 'Open Oil (Root)',
        },
    },
    lazy = false,
}
