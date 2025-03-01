-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ Custom Keymaps ]]
-- Move vertically while also centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })

-- Move selection up and down with ease
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Map Ctrl + a to highlight the whole buffer
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Paste without replacing system clipboard
vim.keymap.set("v", "<leader>p", '"_dP', { silent = true })
vim.keymap.set("n", "<leader>p", '"_dP', { silent = true })

-- Go Awesome Keymap
-- vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
