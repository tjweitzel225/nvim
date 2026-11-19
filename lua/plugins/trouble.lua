return {
    'folke/trouble.nvim',
    opts = {
        modes = {
            symbols = {
                -- drop the trailing "[row, col]" position tag (the default
                -- lsp_document_symbols format is "{kind_icon} {symbol.name} {text:Comment} {pos}")
                format = '{kind_icon} {symbol.name} {text:Comment}',
                -- NOTE: `filter` can't just be a table override here. trouble.nvim's
                -- built-in `symbols` mode ships with a non-empty default filter
                -- (a kind allow-list that excludes "Object", among other things),
                -- and mode configs are merged with `vim.tbl_deep_extend("force", ...)`,
                -- which recurses into tables and merges key-by-key instead of
                -- replacing them. A partial `filter` table here would get merged
                -- with -- not replace -- that default, silently reintroducing the
                -- kind allow-list it excludes (which is exactly what happened: Rust
                -- `impl` blocks, kind "Object", disappeared again). `config` runs
                -- *after* the merge and assigns `opts.filter` directly, so it's
                -- immune to whatever the upstream default contains.
                config = function(opts)
                    opts.filter = {
                        ['not'] = { ft = 'python', kind = 'Variable' },
                    }
                end,
                formatters = {
                    -- the ghost text after the symbol name is the rest of the source
                    -- line, sliced starting at the symbol's selectionRange start --
                    -- which means it always repeats the name itself. Strip exactly
                    -- the selectionRange span (end_pos - pos) off the front so only
                    -- the trailing signature/value remains.
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
                        -- drop a trailing opening brace, e.g. "() -> i32 {" -> "() -> i32"
                        text = text:gsub('%s*{%s*$', '')
                        return { text = vim.trim(text) }
                    end,
                },
            },
        },
    },
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
