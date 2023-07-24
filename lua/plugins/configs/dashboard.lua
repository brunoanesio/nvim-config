local config = {}

config.mru = { limit = 10 }
config.project = { limit = 10 }

config.header = {
  [[                                    ]],
  [[    ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
  [[     ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
  [[           ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
  [[            ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
  [[           ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
  [[    ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
  [[   ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
  [[  ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
  [[  ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
  [[       ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
  [[        ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
  [[                                    ]],
}

config.shortcut = {
  {
    desc = "  New file ",
    action = "enew",
    group = "@string",
    key = "n",
  },
  {
    desc = "  Restore Session ",
    action = function()
      vim.cmd("lua require('persistence').load()")
    end,
    group = "@string",
    key = "s",
  },
  {
    desc = "   File ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    group = "@string",
    key = "f",
  },
  {
    desc = "   Update ",
    action = "Lazy sync",
    group = "@string",
    key = "u",
  },
  {
    desc = " 󰓅  Profile ",
    action = "Lazy profile",
    group = "@string",
    key = "p",
  },
  {
    desc = "   Quit ",
    action = "q!",
    group = "@macro",
    key = "q",
  },
}

config.week_header = { enable = false }
config.footer = { "" }
config.packages = { enable = true }
local options = {
  theme = "hyper",
  config = config,
}
return options
