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
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		opts = {
			filetype_exclude = { "NvimTree", "packer", "lsp-installer", "help" },
			-- char = "▎",
			show_trailing_blankline_indent = false,
			show_first_indent_level = true,
			show_end_of_line = false,
			show_current_context = true,
			show_current_context_start = false,
		},
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
