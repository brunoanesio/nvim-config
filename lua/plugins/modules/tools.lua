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
      create_autocmd = false,
      show_modified = true,
      theme = "catppuccin",
    },
    config = function(_, opts)
      require("barbecue").setup(opts)
      vim.api.nvim_create_autocmd({
        "WinResized",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = function()
      return require("plugins.configs.saga")
    end,
    keys = require("options.lsp_saga_mappings"),
  },

  {
    "folke/which-key.nvim",
    keys = { { "<space>", desc = "WhichKey" }, { "z=", desc = "WhichKey" } },
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

  {
    "GCBallesteros/NotebookNavigator.nvim",
    ft = { "ipynb", "python" },
    dependencies = {
      "hkupty/iron.nvim",
      "anuvyklack/hydra.nvim",
    },
    config = function()
      local nn = require("notebook-navigator")
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
    -- stylua: ignore
    keys = {
      { "]h", function() require("notebook-navigator").move_cell "d" end },
      { "[h", function() require("notebook-navigator").move_cell "u" end },
      { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
  },
}
