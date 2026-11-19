return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nickjvandyke/opencode.nvim' },
    config = function()
        require('lualine').setup({
            theme = 'nord',
            sections = {
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = { { require('opencode').statusline } },
            },
        })
    end,
}
