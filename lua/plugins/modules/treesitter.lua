return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"windwp/nvim-ts-autotag",
			"HiPhish/nvim-ts-rainbow2",
		},
		opts = {
			ensure_installed = {
				"help",
				"python",
				"lua",
				"javascript",
				"html",
				"css",
				"bash",
				"markdown",
				"markdown_inline",
				"vim",
				"rust",
				"norg",
			},

			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			refactor = {
				highlight_definitions = { enable = false },
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = "grr",
					},
				},
				navigation = {
					enable = true,
					keymaps = {
						goto_definition = "gnd",
						list_definitions = "gnD",
						list_definitions_toc = "gO",
						goto_next_usage = "<A-*>",
						goto_previous_usage = "<A-#>",
					},
				},
			},
			autotag = {
				enable = true,
			},
			rainbow = {
				enable = true,
			},
			context_commenstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
