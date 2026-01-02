return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        'rafamadriz/friendly-snippets',
        'xzbdmw/colorful-menu.nvim',
        'bydlw98/blink-cmp-env',
        'mikavilpas/blink-ripgrep.nvim',
    },
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'enter' },
        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },
        signature = {
            enabled = true,
            trigger = {
                show_on_keyword = true,
                -- show_on_trigger_character = true,
                -- show_on_insert = true,
                -- show_on_insert_on_trigger_character = true,
            },
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = true, window = { scrollbar = false } },
            ghost_text = { enabled = true },
            menu = {
                scrollbar = false,
                draw = {
                    treesitter = { 'lsp' },
                    columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require('colorful-menu').blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require('colorful-menu').blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'env', 'ripgrep' },
            providers = {
                ripgrep = {
                    module = 'blink-ripgrep',
                    name = 'ripgrep',
                    opts = {},
                },
                env = {
                    module = 'blink-cmp-env',
                    name = 'Env',
                    opts = {
                        show_braces = false,
                        show_documentation_window = false,
                    },
                },
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
}
