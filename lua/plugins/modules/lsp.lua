return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lsp = require("plugins.configs.servers")
      lsp.setup()
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>li", "<cmd>Mason<CR>", desc = "Mason" } },
    opts = function()
      return require("plugins.configs.mason").opts
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      local ensure_installed = require("plugins.configs.mason")
      ensure_installed.install()
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local sources = require("plugins.configs.nulls").sources
      local on_attach = require("plugins.configs.nulls").on_attach
      local nls = require("null-ls")
      nls.setup({
        sources = sources,
        on_attach = on_attach,
      })
    end,
  },
}
