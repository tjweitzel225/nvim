return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    local mason = require("mason")

    mason.setup()

    vim.lsp.enable({})
    vim.lsp.config('rust_analyzer', { cmd = { 'rust-analyzer' } })
    -- vim.basedpyright.setup({})

  end,
}

