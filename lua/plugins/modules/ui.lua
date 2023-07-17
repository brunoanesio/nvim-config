return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = function()
      return require("plugins.configs.dashboard")
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = function()
      return require("plugins.configs.catppuccin")
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = function()
      return require("plugins.configs.noice")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
    opts = function()
      return require("plugins.configs.lualine")
    end,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.notify = require("notify")
    end,
  },

  {
    "stevearc/dressing.nvim",
    -- event = "BufRead",
    opts = {
      input = {
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
