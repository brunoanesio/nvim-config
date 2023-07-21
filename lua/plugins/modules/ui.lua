return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    opts = function()
      return require("plugins.configs.indent")
    end,
  },

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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
        callback = function(_)
          require("lualine").setup({})
        end,
        pattern = { "*.*" },
        once = true,
      })
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
    "MaximilianLloyd/ascii.nvim",
  },
}
