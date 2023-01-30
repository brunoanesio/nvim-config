return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				term_colors = false,
				transparent_background = false,
				no_italic = true,
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
					lsp_saga = true,
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
					noice = true,
					notify = true,
					mason = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					ts_rainbow = true,
					which_key = true,
				},
			})
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},
}
