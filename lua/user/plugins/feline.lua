local ctp_feline = require("catppuccin.groups.integrations.feline")

ctp_feline.setup({
	assets = {
		left_separator = "",
		right_separator = "",
		bar = "█",
		mode_icon = " ",
		dir = "  ",
		file = "   ",
		lsp = {
			server = "  ",
			error = "  ",
			warning = "  ",
			info = "  ",
			hint = "  ",
		},
		git = {
			branch = "  ",
			added = "  ",
			changed = "  ",
			removed = "  ",
		},
	},
})

require("feline").setup({
	components = ctp_feline.get(),
	force_inactive = {
		filetypes = {
			"^NvimTree$",
			"^packer$",
			"^startify$",
			"^fugitive$",
			"^fugitiveblame$",
			"^qf$",
			"^help$",
		},
		buftypes = {
			"^terminal$",
		},
		bufnames = {},
	},
	disable = {
		filetypes = {
			"^alpha$",
			"^dashboard$",
		},
	},
})
