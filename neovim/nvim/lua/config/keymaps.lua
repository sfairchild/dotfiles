-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Up>", "<cmd>resize +2<cr>", { noremap = true, desc = "Increase window height" })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<cr>", { noremap = true, desc = "Decrease window height" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<cr>", { noremap = true, desc = "Decrease window width" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<cr>", { noremap = true, desc = "Increase window width" })
