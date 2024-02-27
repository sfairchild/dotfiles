require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      pycodestyle = { "pycodestyle" },
      plugins = {
        flake8 = {
          enabled = true,
          -- ignore = { "E501" },
        },
        pycodestyle = {
          enabled = true,
          ignore = { "W391" },
          maxLineLength = 120,
        },
      },
    },
  },
})

require("null-ls")

require("lspconfig").terraformls.setup({})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = vim.lsp.buf.format(),
})
