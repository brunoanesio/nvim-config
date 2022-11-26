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
	{ icon = " ", desc = "New file                         ", action = "Telescope find_files" },
	{ icon = " ", desc = "Find file                        ", action = "enew" },
	{ icon = " ", desc = "Recently used files              ", action = "Telescope oldfiles" },
	{ icon = " ", desc = "Configuration                    ", action = "cd ~/.config/nvim | e $MYVIMRC" },
	{ icon = " ", desc = "Update plugins                   ", action = "PackerSync" },
	{ icon = " ", desc = "Quit Neovim                      ", action = "qa" },
}
