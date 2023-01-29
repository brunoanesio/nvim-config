return {
	{
		"j-hui/fidget.nvim",
		opts = {
			window = {
				blend = 100,
			},
		},
		config = function(_, opts)
			require("fidget").setup(opts)
		end,
	},
}
