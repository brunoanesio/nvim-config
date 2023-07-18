local config = {
  flavour = "mocha",
  term_colors = false,
  transparent_background = false,
  no_italic = true,
  show_end_of_buffer = false,
  styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    alpha = false,
    barbecue = {
      dim_dirname = true,
      bold_basename = true,
      dim_context = false,
      alt_background = false,
    },
    cmp = true,
    dashboard = true,
    dap = {
      enabled = true,
      enabled_ui = true,
    },
    gitsigns = true,
    illuminate = true,
    lsp_saga = true,
    markdown = true,
    mason = true,
    mini = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    noice = true,
    notify = true,
    neotree = true,
    telescope = { enabled = true, style = "nvchad" },
    treesitter = true,
    rainbow_delimiters = true,
    which_key = true,
  },
  color_overrides = {
    mocha = {
      base = "#1E1D2D",
    },
  },
  custom_highlights = function(colors)
    return {
      NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
      DiagnosticVirtualTextError = { fg = colors.red, bg = colors.none },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.none },
      DiagnosticVirtualTextInfo = { fg = colors.sky, bg = colors.none },
      DiagnosticVirtualTextHint = { fg = colors.teal, bg = colors.none },
    }
  end,
}
return config
