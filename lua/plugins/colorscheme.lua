return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 100,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				term_colors = false,
				transparent_background = false,
				no_italic = true,
				show_end_of_buffer = false,
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
					cmp = true,
					dashboard = true,
					gitsigns = true,
					illuminate = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					lsp_saga = true,
					mason = true,
					markdown = true,
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
					noice = true,
					notify = true,
					neotree = true,
					telescope = true,
					treesitter = true,
					ts_rainbow2 = true,
					which_key = true,
				},
			})
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},
}
