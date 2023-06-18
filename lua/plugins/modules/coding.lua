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
    "jcdickinson/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },

  {
    "echasnovski/mini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local opts = require("plugins.configs.mini")
      local comment = opts.comment_config
      local indent = opts.indent_config
      local patterns = opts.patterns
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.ai").setup()
      require("mini.jump").setup()
      require("mini.comment").setup(comment)
      require("mini.indentscope").setup(indent)
      require("mini.hipatterns").setup(patterns)
      require("plugins.configs.mini").indent()
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
