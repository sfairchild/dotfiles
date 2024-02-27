-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Up>", "<cmd>resize +2<cr>", { noremap = true, desc = "Increase window height" })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<cr>", { noremap = true, desc = "Decrease window height" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<cr>", { noremap = true, desc = "Decrease window width" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<cr>", { noremap = true, desc = "Increase window width" })

-- vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", { noremap = true, desc = "Toggle Undotree" })
-- vim.keymap.set("n", "<leader>nn", "<cmd>Neorg<cr>", { noremap = true, desc = "Toggle Undotree" })

local wk = require("which-key")
wk.register({
  h = {
    name = "harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
    r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "remove file" },
    m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next file" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous file" },
    ["1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
    ["2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
    ["3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
  },
  H = {
    name = "help/debug/conceal",
    c = {
      name = "conceal",
      h = { ":set conceallevel=1<cr>", "hide/conceal" },
      s = { ":set conceallevel=0<cr>", "show/unconceal" },
    },
    t = {
      name = "treesitter",
      t = { vim.treesitter.inspect_tree, "show tree" },
      c = { ":=vim.treesitter.get_captures_at_cursor()<cr>", "show capture" },
      n = { ":=vim.treesitter.get_node():type()<cr>", "show node" },
    },
  },
  n = {
    name = "Neorg",
    n = { "<cmd>Neorg<cr>", "Neorg Window", noremap = true },
    o = { "<cmd>Neorg keybind norg core.integrations.telescope.switch_workspace<cr>", "Neorg Window", noremap = true },
  },
  j = {
    name = "Undotree",
    u = {
      "<cmd>Neorg keybind norg core.integrations.telescope.switch_workspace<cr>",
      "Switch workspace",
      noremap = true,
    },
  },
  e = { "<cmd>Oil<cr>", "Toggle Oil", noremap = true },
  b = {
    y = { "<cmd>let @+=expand('%')<cr>", "Yank file name from cwd" },
    Y = { "<cmd>let @+=expand('%:p')<cr>", "Yank file name from root" },
  },
}, { prefix = "<leader>" })
