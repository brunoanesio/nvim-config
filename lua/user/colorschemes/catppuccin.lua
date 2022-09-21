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
		treesitter = true,
		treesitter_context = true,
		which_key = true,
		lightspeed = true,
		nvimtree = false,
		lsp_saga = false,
		fidget = true,
		gitsigns = true,
		notify = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		bufferline = true,
		ts_rainbow = true,
		navic = {
			enabled = true,
		},
	},
})

vim.cmd([[colorscheme catppuccin]])
