return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        index = { enable = true },
        highlight = { enable = true },
        folds = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<Enter>',
                node_incremental = '<Enter>',
                scope_incremental = false,
                node_decremental = '<Backspace>',
            },
        },
    },
}
