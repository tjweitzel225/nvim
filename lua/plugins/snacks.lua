vim.api.nvim_create_autocmd('User', {
    pattern = 'OilActionsPost',
    callback = function(event)
        if event.data.actions[1].type == 'move' then
            Snacks.rename.on_rename_file(
                event.data.actions[1].src_url,
                event.data.actions[1].dest_url
            )
        end
    end,
})

return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        input = { enabled = true },
        git = { enabled = true },
        indent = { enabled = false },
        rename = { enabled = true },
        scope = { enabled = true },
        toggle = { enabled = true },
        words = { enabled = false },
        picker = { enabled = true, keys = { ['<a-o>'] = { 'opencode_send', mode = { 'n', 'i' } } } },
    },
    keys = {
        {
            ']]',
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = 'Next Reference',
            mode = { 'n', 't' },
        },
        {
            '[[',
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = 'Prev Reference',
            mode = { 'n', 't' },
        },
        {
            '<leader>bd',
            function()
                Snacks.bufdelete()
            end,
            desc = 'Delete Buffer',
        },
    },
    actions = {
        opencode_send = function(picker) ---@param picker snacks.Picker
            local items = vim.tbl_map(function(item) ---@param item snacks.picker.Item
                return item.file
                        and require('opencode').format {
                            path = item.file,
                            from = item.pos,
                            to = item.end_pos,
                        }
                    or item.text
            end, picker:selected { fallback = true })

            require('opencode').prompt(table.concat(items, ', ') .. ' ')
        end,
    },
    config = function(_, opts)
        Snacks.setup(opts)

        Snacks.toggle.diagnostics():map('<leader>ud')
        Snacks.toggle.line_number():map('<leader>ul')
        Snacks.toggle.inlay_hints():map('<leader>uh')
        Snacks.toggle.indent():map('<leader>ug')
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
    end,
}
