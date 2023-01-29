return {
	{
		"RRethy/vim-illuminate",
		event = "BufReadPre",
		opts = {
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100,
			filetypes_denylist = {
				"dirvish",
				"fugitive",
				"alpha",
				"dashboard",
				"NvimTree",
				"Toggleterm",
				"DressingSelect",
			},
			filetypes_allowlist = {},
			modes_denylist = {},
			modes_allowlist = {},
			under_cursor = true,
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" }),
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" }),
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" }),
	},
}
