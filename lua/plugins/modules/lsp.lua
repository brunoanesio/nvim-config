return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
    },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    opts = function()
      return require("plugins.configs.lsp").opts
    end,
    config = function(_, opts)
      local lsp_setup = require("plugins.configs.servers").setup
      lsp_setup()
      local config_setup = require("plugins.configs.lsp").config
      config_setup()
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>li", "<cmd>Mason<CR>", desc = "Mason" } },
    dependencies = { "stevearc/dressing.nvim" },
    opts = function()
      return require("plugins.configs.mason").opts
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      local ensure_installed = require("plugins.configs.mason").install
      ensure_installed()
    end,
  },

  {
    "mhartington/formatter.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return require("plugins.configs.formatter")
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
