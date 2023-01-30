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
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
				},
				lualine_c = { "filename" },
				lualine_x = {
					{ "diagnostics", symbols = { error = "✖ ", warn = "! ", info = " ", hint = " " } },
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
					"location",
				},
			},
			extensions = { "nvim-tree", "toggleterm", "neo-tree" },
		},
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
}
