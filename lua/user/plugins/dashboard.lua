local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	return
end

db.custom_header = {
	[[                                                                   ]],
	[[                                                                   ]],
	[[ ██████   █████                                ███                 ]],
	[[░░██████ ░░███                                ░░░                  ]],
	[[ ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  ]],
	[[ ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ]],
	[[ ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ]],
	[[ ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ]],
	[[ █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████]],
	[[░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
	[[                                                                   ]],
	[[                                                                   ]],
}
db.custom_center = {
	{ icon = " ", desc = "New file                         ", shortcut = "SPC f f",action = "Telescope find_files" },
	{ icon = " ", desc = "Find file                        ", shortcut = "SPC f n", action = "enew" },
	{ icon = " ", desc = "Recently used files              ", shortcut = "SPC f r", action = "Telescope oldfiles" },
	{ icon = " ", desc = "Configuration                    ", shortcut = "SPC f c", action = "cd ~/.config/nvim | e $MYVIMRC" },
	{ icon = " ", desc = "Update plugins                   ", shortcut = "SPC p u", action = "PackerSync" },
	{ icon = " ", desc = "Quit Neovim                      ", shortcut = "SPC q q", action = "qa" },
}
