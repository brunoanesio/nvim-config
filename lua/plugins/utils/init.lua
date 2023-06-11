local M = {}

M.border_chars_none = { "", "", "", "", "", "", "", "" }
M.border_chars_empty = { " ", " ", " ", " ", " ", " ", " ", " " }
M.border_chars_tmux = { " ", " ", " ", " ", " ", " ", " ", " " }
M.border_chars_inner_thick = { " ", "▄", " ", "▌", " ", "▀", " ", "▐" }
M.border_chars_outer_thick = { "▛", "▀", "▜", "▐", "▟", "▄", "▙", "▌" }
M.border_chars_outer_thin = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
M.border_chars_inner_thin = { " ", "▁", " ", "▏", " ", "▔", " ", "▕" }
M.border_chars_outer_thin_telescope = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" }
M.border_chars_outer_thick_telescope = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" }

M.bottom_thin = "▁"
M.top_thin = "▔"
M.left_thin = "▏"
M.right_thin = "▕"
M.left_thick = "▎"
M.right_thick = "🮇"
M.full_block = "█"
M.top_right_thin = "🭾"
M.top_left_thin = "🭽"
M.bottom_left_thin = "🭼"
M.bottom_right_thin = "🭿"
M.top_and_bottom = "🮀"

M.lsp_signs = { Error = " ", Warn = "! ", Hint = "󰛩 ", Info = " " }

M.cmp_kinds = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = "",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = "  ",
  Event = "",
  Operator = " ",
  TypeParameter = " ",
}

M.mason_packages = {
  "bash-language-server",
  "black",
  "css-lsp",
  "djlint",
  -- "eslint_d",
  "emmet-ls",
  "html-lsp",
  "isort",
  "json-lsp",
  "lua-language-server",
  "marksman",
  "prettier",
  "python-lsp-server",
  "rust-analyzer",
  "ruff",
  "ruff-lsp",
  "shellcheck",
  "shfmt",
  "stylua",
  "taplo",
  -- "typescript-language-server",
}

return M
