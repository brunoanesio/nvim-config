local options = {
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    border = "single",
    code_action = "󰛩 ",
    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
  },
  lightbulb = {
    enable = true,
    sign = false,
    virtual_text = true,
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
  hover = {
    open_browser = "!firefox",
  },
}
return options
