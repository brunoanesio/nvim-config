return {
	{
		"AckslD/nvim-neoclip.lua",
		opts = {
			default_register = { '"', "+", "*" },
			keys = {
				telescope = {
					i = {
						select = "<cr>",
						paste = "<s-p>",
						paste_behind = "<c-k>",
						replay = "<c-q>", -- replay a macro
						delete = "<c-d>", -- delete an entry
						custom = {},
					},
					n = {
						select = "<cr>",
						paste = "p",
						paste_behind = "P",
						replay = "q",
						delete = "d",
						custom = {},
					},
				},
			},
		},
		config = function(_, opts)
			require("neoclip").setup(opts)
		end,
	},
}
