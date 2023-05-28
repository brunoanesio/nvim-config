return {
  {
    "L3MON4D3/LuaSnip",
    event = "BufReadPre",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      return require("plugins.configs.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },

  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },

  {
    "echasnovski/mini.comment",
    keys = { "gc", "gcc" },
    opts = function()
      return require("plugins.configs.mini").comment_config
    end,
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = function()
      return require("plugins.configs.gitsigns")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
}
