-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Diagnostic keymaps ]]
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- [[ Custom Keymaps ]]
-- Move vertically while also centering
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

-- Move selection up and down with ease
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- Use normal Ctrl+Backspace to erase words easily while writing
vim.keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- Map Ctrl + a to highlight the whole buffer
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- Paste without replacing system clipboard
vim.keymap.set('n', '<leader>p', '"_dP', { silent = true })

-- Save using Ctrl + s like all other platforms
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true })

-- Clear All Whitespace
vim.api.nvim_set_keymap('n', '<leader>cw', [[:%s/\s\+$//e<CR>]],
    { noremap = true, silent = true, desc = 'Clear All Trailing Whitespace.' })

-- Clear Carriage for some weird characters "^M"
vim.api.nvim_set_keymap('n', '<leader>cc', [[:%s/\r//g<CR>]],
    { noremap = true, silent = true, desc = 'Clear Format' })

-- Go Awesome Keymap
vim.keymap.set("n", "<leader>e", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
