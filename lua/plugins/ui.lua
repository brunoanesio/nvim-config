return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				component_separators = "", -- │
				section_separators = { left = "", right = "" },
				theme = "catppuccin",
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
				},
				lualine_c = { "filename" },
				lualine_x = {
					{ "diagnostics", symbols = { error = " ", warn = "! ", info = " ", hint = " " } },
					{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "neo-tree", "lazy" },
		},
	},

	{
		"echasnovski/mini.indentscope",
		event = "BufReadPost",
		opts = {
			symbol = "▏",
			-- symbol = "│",
			-- symbol = "▎",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("Filetype", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},

	{
		"echasnovski/mini.animate",
		event = "BufReadPost",
		opts = {
			resize = {
				enable = false,
			},
			open = {
				enable = false,
			},
			close = {
				enable = false,
			},
		},
		config = function(_, opts)
			require("mini.animate").setup(opts)
		end,
	},

	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			-- background_colour = "#000000",
		},
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
