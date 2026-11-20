return {
    'rmehri01/onenord.nvim',
    priority = 100,
    opts = {
        transparent = false,
        styles = {
            -- applied to `Comment` and `@comment` (see `:h highlight-args`)
            comments = 'italic',
        },
        custom_highlights = {
            dark = {
                -- Comments default to the same gray as inlay hints (#6C7A96);
                -- tint them toward Nord blue so the two are distinguishable.
                Comment = { fg = '#D6AB85' },
                ['@comment'] = { fg = '#D6AB85' },
            },
        },
    },
}
