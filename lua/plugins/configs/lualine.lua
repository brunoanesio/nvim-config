local options = {
	options = {
		icons_enabled = true,
		component_separators = "", -- │
		section_separators = "",
		theme = "catppuccin",
		disabled_filetypes = { statusline = { "alpha", "dashboard" } },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "fancy_mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{
				"filename",
				path = 1,
				symbols = { modified = "  ", readonly = "", unnamed = "" },
			},
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = { error = " ", warn = "! ", info = " ", hint = " " },
			},
		},
		lualine_x = {
			"fancy_lsp_servers",
		},
		lualine_y = { "progress" },
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
	extensions = { "neo-tree", "lazy" },
}
return options
