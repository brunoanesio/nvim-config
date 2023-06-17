local sep_right = { right = "" }
local sep_left = { left = "" }
local options = {
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    theme = "catppuccin",
    disabled_filetypes = { statusline = { "alpha", "dashboard" } },
    always_divide_middle = true,
    globalstatus = true,
  },
  -- stylua: ignore
  sections = {
    lualine_a = { { "fancy_mode", separator = sep_right } },
    lualine_b = {
      { "branch", separator = sep_right },
      { "diff", padding = { left = 0, right = 1 }, separator = sep_right } },
    lualine_c = {
      { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
      { "filename", path = 0 },
    },
    lualine_x = {
      { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = "! ", info = " ", hint = "󰛩 " } },
      { "fancy_lsp_servers", icon = " " },
    },
    lualine_y = { { "progress", icon = { "", align = "left" }, separator = sep_left } },
    lualine_z = { { "fancy_location", icon = "", separator = sep_left, padding = { right = 1 } } },
  },
  extensions = { "neo-tree", "lazy" },
}
return options
