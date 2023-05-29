return {
  { "davidgranstrom/nvim-markdown-preview", ft = "markdown" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
    },
    opts = function()
      return require("plugins.configs.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return require("plugins.configs.illuminate")
    end,
    config = function(_, opts)
      require("illuminate").configure(opts)
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      return require("plugins.configs.telescope")
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTreeFocusToggle",
    keys = {
      { "<leader>e", "<cmd>NeoTreeFocusToggle<CR>", desc = "Toggle NeoTree", remap = true },
    },
    opts = function()
      return require("plugins.configs.neotree")
    end,
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  },
}
