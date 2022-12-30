-- local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
	flavour = "mocha",
	term_colors = false,
	transparent_background = true,
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		dashboard = true,
		fidget = true,
		gitsigns = true,
		illuminate = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		lightspeed = true,
		lsp_saga = false,
		cmp = true,
		navic = {
			enabled = true,
			custom_bg = "NONE",
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		notify = true,
		mason = true,
		nvimtree = false,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = true,
		which_key = true,
	},
})
vim.api.nvim_command("colorscheme catppuccin")
