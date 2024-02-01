return {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            }
        })

        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true })
        vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true })
    end
}
