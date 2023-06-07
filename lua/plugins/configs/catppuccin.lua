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
    telescope = true,
    treesitter = true,
    ts_rainbow2 = true,
    which_key = true,
  },
  custom_highlights = function(colors)
    return {
      TelescopeSelection = { bg = colors.surface0 },
      TelescopePromptCounter = { fg = colors.mauve },
      TelescopePromptPrefix = { bg = colors.surface0 },
      TelescopePromptNormal = { bg = colors.surface0 },
      TelescopeResultsNormal = { bg = colors.mantle },
      TelescopePreviewNormal = { bg = colors.crust },
      TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
      TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
      TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
      TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
      NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
      DiagnosticVirtualTextError = { fg = colors.red, bg = colors.none },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.none },
      DiagnosticVirtualTextInfo = { fg = colors.sky, bg = colors.none },
      DiagnosticVirtualTextHint = { fg = colors.teal, bg = colors.none },
    }
  end,
}
return config
