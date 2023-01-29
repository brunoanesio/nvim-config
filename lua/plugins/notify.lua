return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("notify").setup({
				-- for transparent background
				-- background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	},
}
