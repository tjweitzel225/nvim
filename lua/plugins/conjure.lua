return {
    'Olical/conjure',
    ft = { 'clojure', 'python' },
    lazy = false,
    keys = {
        {
            '<leader>cR',
            function()
                vim.cmd.normal(' cS')
                vim.cmd.normal(' cq')
            end,
            desc = 'Restart REPL',
        },
    },
    init = function()
        local settings = {
            ['mapping#prefix'] = ' ',
            ['mapping#enable_defaults'] = false,
            ['mapping#log_toggle'] = 'll',
            ['mapping#log_buf'] = 'lL',
            ['mapping#log_reset_soft'] = 'lc',
            ['mapping#log_reset_hard'] = 'lC',
            ['mapping#eval_current_form'] = 'ee',
            ['mapping#eval_comment_current_form'] = 'eE',
            ['mapping#eval_root_form'] = 'er',
            ['mapping#eval_comment_root_form'] = 'eR',
            ['mapping#eval_word'] = 'ew',
            ['mapping#eval_previous'] = 'ep',
            ['mapping#eval_replace_form'] = 'e!',
            ['mapping#eval_marked_form'] = 'em',
            ['mapping#eval_file'] = 'ef',
            ['mapping#eval_buf'] = 'eb',
            ['mapping#eval_visual'] = 'e',
            ['mapping#eval_motion'] = 'e',
            ['highlight#enabled'] = true,
            ['highlight#timeout'] = 200,
            ['log#break_length'] = 40,
            ['client_on_load'] = true,
            ['client#python#stdio#mapping#start'] = 'cq',
            ['client#python#stdio#mapping#stop'] = 'cS',
        }
        for i, v in pairs(settings) do
            vim.g['conjure#' .. i] = v
        end
    end,
}
