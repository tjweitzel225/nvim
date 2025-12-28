return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        theme = 'nord',
        sections = { lualine_x = {'location'}, lualine_y = {}, lualine_z = {} },
    },
}
