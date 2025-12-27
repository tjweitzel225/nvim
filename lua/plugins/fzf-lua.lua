return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<leader><space>', '<cmd>FzfLua files<cr>' },
        { '<leader>/', '<cmd>FzfLua grep_visual<cr>' },
    },
    opts = { fzf_colors = true },
}
