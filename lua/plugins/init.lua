vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins.modules", {
	install = {
		colorscheme = { "catppuccin" },
		missing = true,
	},
	ui = {
		border = "none",
		icons = {
			ft = "",
			loaded = "",
			not_loaded = "",
		},
	},
	checker = {
		enabled = false,
		notify = true,
	},
	change_detection = {
		enabled = true,
		notify = "false",
	},
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
		},
	},
})
