return {
	{
		"rmagatti/auto-session",
		opts = {
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
		},
		config = function(_, opts)
			require("auto-session").setup(opts)
		end,
	},
}
