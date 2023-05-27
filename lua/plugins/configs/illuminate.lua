local options = {
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
}
return options
