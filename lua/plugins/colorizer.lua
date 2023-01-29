return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		opts = {
			render = "background", -- 'background','foreground','first_column'
			enable_tailwind = true,
		},
		config = function(_, opts)
			require("nvim-highlight-colors").setup(opts)
		end,
	},
}
