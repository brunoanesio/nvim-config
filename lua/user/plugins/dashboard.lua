local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	return
end

db.setup({
	theme = "doom",
	config = {
		header = {
			[[                                                                   ]],
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
			[[                                                                   ]],
		},
		center = {
			{
				icon = "   ",
				icon_hi = "Title",
				desc = "New File                                            ",
				desc_hi = "String",
				key = "n",
				key_hi = "Constant",
				keymap = "SPC f n",
				action = "enew",
			},
			{
				icon = "   ",
				icon_hi = "Title",
				desc = "Find File                                           ",
				desc_hi = "String",
				key = "f",
				key_hi = "Constant",
				keymap = "SPC f f",
				action = "Telescope find_files",
			},
			{
				icon = "   ",
				icon_hi = "Title",
				desc = "Recent Files                                        ",
				desc_hi = "String",
				key = "r",
				key_hi = "Constant",
				keymap = "SPC f r",
				action = "Telescope oldfiles",
			},
			{
				icon = "   ",
				icon_hi = "Title",
				desc = "Configuration                                       ",
				desc_hi = "String",
				key = "c",
				key_hi = "Number",
				keymap = "SPC f c",
				action = "cd ~/.config/nvim | e $MYVIMRC",
			},
			{
				icon = "   ",
				icon_hi = "Title",
				desc = "Update Plugins                                      ",
				desc_hi = "String",
				key = "u",
				key_hi = "Constant",
				keymap = "SPC p u",
				action = "PackerSync",
			},
			{
				icon = "   ",
				icon_hi = "Title",
				desc = "Quit Neovim                                         ",
				desc_hi = "String",
				key = "q",
				key_hi = "Constant",
				keymap = "SPC q q",
				action = "qa",
			},
		},
	},
})
