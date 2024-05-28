return {
  "rmagatti/session-lens",
  requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
  config = function()
    require("session-lens").setup({--[[your custom config--]]
    })
  end,
}
