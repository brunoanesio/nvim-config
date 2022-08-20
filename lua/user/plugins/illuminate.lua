require("illuminate").configure({
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
		"NvimTree",
		"Toggleterm",
		"DressingSelect",
	},
	filetypes_allowlist = {},
	modes_denylist = {},
	modes_allowlist = {},
	under_cursor = true,
})
