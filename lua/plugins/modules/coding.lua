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
    "echasnovski/mini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    init = require("plugins.configs.mini").indent,
    config = function()
      local opts = require("plugins.configs.mini")
      local comment = opts.comment_config
      local indent = opts.indent_config
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.ai").setup()
      require("mini.jump").setup()
      require("mini.comment").setup(comment)
      require("mini.indentscope").setup(indent)
      require("mini.hipatterns").setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })
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
