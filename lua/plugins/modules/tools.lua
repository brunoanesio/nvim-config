return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = function()
      return require("plugins.configs.persistence").opts
    end,
    keys = function()
      return require("plugins.configs.persistence").mappings
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function()
      return require("plugins.configs.rust_tools")
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  {
    "NvChad/nvterm",
    event = "BufReadPre",
    opts = function()
      return require("plugins.configs.nvterm").opts
    end,
    config = function(_, opts)
      require("nvterm").setup(opts)
    end,
    keys = function()
      return require("plugins.configs.nvterm").mappings
    end,
  },

  {
    "utilyre/barbecue.nvim",
    event = "BufRead",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = "catppuccin",
    },
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = function()
      return require("plugins.configs.saga")
    end,
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
    keys = require("options.lsp_saga_mappings"),
  },
}
