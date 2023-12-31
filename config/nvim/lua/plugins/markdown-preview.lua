return {
    -- Markdown Previews
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    lazy = false,
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
        vim.g.mkdp_theme = 'dark'
    end,
    config = function()
        vim.keymap.set('n', '<leader>mp', '<cmd> MarkdownPreview<CR>', { noremap = true })
        vim.keymap.set('n', '<leader>ms', '<cmd> MarkdownPreviewStop<CR>', { noremap = true })
    end
}
