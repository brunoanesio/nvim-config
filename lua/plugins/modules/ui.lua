return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = function()
			return require("plugins.configs.noice")
		end,
		config = function(_, opts)
			require("noice").setup(opts)
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
		opts = function()
			return require("plugins.configs.lualine")
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},

	{
		"echasnovski/mini.indentscope",
		event = "BufReadPost",
		opts = function()
			return require("plugins.configs.mini").indent_config
		end,
		init = require("plugins.configs.mini").indent_init,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},

	{
		"echasnovski/mini.animate",
		event = "BufReadPost",
		opts = function()
			return require("plugins.configs.mini").animate_config
		end,
		config = function(_, opts)
			require("mini.animate").setup(opts)
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
