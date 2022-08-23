require("project_nvim").setup({
	exclude_dirs = {
		"~/.dotfiles/*",
		"~/.local/*",
		"~/Downloads",
		"~/.var/*",
		"~/.config/gtk-4.0",
	},
	show_hidden = false,
})
