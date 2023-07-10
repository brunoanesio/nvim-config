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
    "mhartington/formatter.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return require("plugins.configs.formatter")
    end,
    config = function(_, opts)
      require("formatter").setup(opts)
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        html = { "curlylint" },
        htmldjango = { "curlylint" },
      }
    end,
  },
}
