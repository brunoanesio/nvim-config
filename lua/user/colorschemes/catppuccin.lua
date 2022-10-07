vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
	term_colors = false,
	transparent_background = false,
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "italic" },
		keywords = { "italic" },
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
		navic = {
			enabled = true,
			-- custom_bg = colors.base,
		},
		notify = true,
		nvimtree = false,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = true,
		which_key = true,
	},
})
vim.api.nvim_command("colorscheme catppuccin")
