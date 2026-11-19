return {
    'folke/trouble.nvim',
    opts = {
        modes = {
            symbols = {
                format = '{kind_icon}  {symbol.name}  {text:Comment}',
                config = function(opts)
                    opts.filter = {
                        ['not'] = { ft = 'python', kind = 'Variable' },
                    }
                end,
                formatters = {
                    text = function(ctx)
                        local item = ctx.item
                        local text = item.text or ''
                        if item.pos and item.end_pos and item.pos[1] == item.end_pos[1] then
                            local skip = item.end_pos[2] - item.pos[2]
                            if skip > 0 and skip <= #text then
                                text = text:sub(skip + 1)
                            end
                        end
                        text = vim.trim(text)
                        text = text:gsub('%s*{%s*$', '')
                        return { text = vim.trim(text) }
                    end,
                },
            },
        },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
        {
            '<leader>xx',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Diagnostics (Trouble)',
        },
        {
            '<leader>xX',
            '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
            desc = 'Buffer Diagnostics (Trouble)',
        },
        {
            '<leader>cs',
            '<cmd>Trouble symbols toggle focus=false<cr>',
            desc = 'Symbols (Trouble)',
        },
        {
            '<leader>cl',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'LSP Definitions / references / ... (Trouble)',
        },
        {
            '<leader>xL',
            '<cmd>Trouble loclist toggle<cr>',
            desc = 'Location List (Trouble)',
        },
        {
            '<leader>xQ',
            '<cmd>Trouble qflist toggle<cr>',
            desc = 'Quickfix List (Trouble)',
        },
    },
}
