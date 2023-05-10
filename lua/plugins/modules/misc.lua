return {
	-- QoL
	"famiu/bufdelete.nvim",
	-- Markdown
	{ "davidgranstrom/nvim-markdown-preview", ft = "markdown" },
	-- LSP
	{
		"jose-elias-alvarez/typescript.nvim",
		ft = "typescript",
		opts = {
			disable_commands = false,
		},
		config = function(_, opts)
			require("typescript").setup(opts)
		end,
	},
}
