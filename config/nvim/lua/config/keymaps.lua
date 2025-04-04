-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ Diagnostic keymaps ]]
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

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

-- Ctrl + Backspace to delete words
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })

-- Go Awesome Keymap "Check Error"
vim.keymap.set(
  "n",
  "<leader>ce",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { noremap = true, desc = "Golang Check Error" }
)
