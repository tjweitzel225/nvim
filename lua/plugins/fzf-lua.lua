return {
    'ibhagwan/fzf-lua',
    priority=999,
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<leader><space>', '<cmd>FzfLua files<cr>', desc = 'Search files'},
        { '<leader>/', '<cmd>FzfLua grep_visual<cr>', desc = 'Grep'},
    },
    opts = { fzf_colors = { true }, winopts = { preview = { scrollbar = false } } },
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
}
