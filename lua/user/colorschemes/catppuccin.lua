vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	term_colors = false,
	transparent_background = false,
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
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
		suffix = "_compiled",
	},
	integrations = {
		dashboard = true,
		fidget = true,
		gitsigns = true,
		illuminate = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		lightspeed = true,
		lsp_saga = false,
		navic = {
			enabled = true,
			custom_bg = "#1e1e2e",
		},
		notify = true,
		nvimtree = false,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = true,
		which_key = true,
	},
})

vim.cmd([[colorscheme catppuccin]])
