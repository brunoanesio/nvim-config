return {

  { "fladson/vim-kitty", ft = "kitty" },

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
    "nvimdev/lspsaga.nvim",
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

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { "<space>", desc = "WhichKey" },
    opts = function()
      return require("plugins.configs.whichkey")
    end,
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(require("options.which_key_mappings"), {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })
    end,
  },
}
