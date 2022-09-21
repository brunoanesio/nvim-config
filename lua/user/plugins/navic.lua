vim.g.navic_silence = false
require("nvim-navic").setup({
	icons = {
		File = " ",
		Class = " ",
		Property = " ",
		Field = " ",
		Enum = " ",
		Interface = " ",
		Variable = " ",
		Constant = " ",
		Boolean = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
	},
	highlight = true,
	-- separator = " > ",
	separator = "  ",
})
