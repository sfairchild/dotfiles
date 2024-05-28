return {
  "nvim-neorg/neorg",
  lazy = false,
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.export"] = {}, -- Exports Neorg documents into any other supported filetype
      ["core.export.markdown"] = {}, -- Interface for core.export to allow exporting to markdown
      ["core.tempus"] = {}, -- Adds pretty icons to your documents
      ["core.ui"] = {},
      ["core.ui.calendar"] = {}, -- Adds a gui calendar
      ["core.esupports.hop"] = {},
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
        },
      },
      ["core.keybinds"] = { -- Configure core.keybinds
        config = {
          default_keybinds = true, -- Generate the default keybinds
          hook = function(keybinds)
            keybinds.remap_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
            keybinds.map("norg", "n", "<leader>nn", "<cmd>")
          end,
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.integrations.telescope"] = {},
    },
  },
  -- config = function()
  --   require("neorg").setup({
  --     -- configuration here
  --   })
  -- end,
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
}

-- .../.local/share/nvim/lazy/neorg/lua/neorg/core/modules.lua:438
-- Unable to load module core.exports - module 'neorg.modules.core.exports.module' not found:
-- 	no field package.preload['neorg.modules.core.exports.module']
-- cache_loader: module neorg.modules.core.exports.module not found
-- cache_loader_lib: module neorg.modules.core.exports.module not found
-- 	no file './neorg/modules/core/exports/module.lua'
-- 	no file '/usr/local/share/luajit-2.1.0-beta3/neorg/modules/core/exports/module.lua'
-- 	no file '/usr/local/share/lua/5.1/neorg/modules/core/exports/module.lua'
-- 	no file '/usr/local/share/lua/5.1/neorg/modules/core/exports/module/init.lua'
-- 	no file './neorg/modules/core/exports/module.so'
-- 	no file '/usr/local/lib/lua/5.1/neorg/modules/core/exports/module.so'
-- 	no file '/usr/local/lib/lua/5.1/loadall.so'
-- 	no file './neorg.so'
-- 	no file '/usr/local/lib/lua/5.1/neorg.so'
-- 	no file '/usr/local/lib/lua/5.1/loadall.so'
