return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100,
    lazy = false,
    opts = function()
      return require("plugins.configs.catppuccin")
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
}
