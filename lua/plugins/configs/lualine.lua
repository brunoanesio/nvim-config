-- Using Lualine as the statusline.

-- Custom mode names.
local mode_map = {
  ["COMMAND"] = "CMD",
  ["TERMINAL"] = "TER",
  ["NORMAL"] = "NOR",
  ["INSERT"] = "INS",
  ["VISUAL"] = "VIS",
  ["V-LINE"] = "VLN",
  ["V-BLOCK"] = "VBK",
}
local function fmt_mode(s)
  return mode_map[s] or s
end

-- Show git status.
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
  end
end

-- Get the current buffer's filetype.
local function get_current_filetype()
  return vim.api.nvim_buf_get_option(0, "filetype")
end

-- Get the current buffer's type.
local function get_current_buftype()
  return vim.api.nvim_buf_get_option(0, "buftype")
end

-- Get the buffer's filename.
local function get_current_filename()
  local bufname = vim.api.nvim_buf_get_name(0)
  return bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or ""
end

-- Gets the current buffer's filename with the filetype icon supplied
-- by devicons.
local M = require("lualine.components.filetype"):extend()
Icon_hl_cache = {}
local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
  highlight = "lualine.highlight",
  utils = "lualine.utils.utils",
})

function M:get_current_filetype_icon()
  -- Get setup.
  local icon, icon_highlight_group
  local _, devicons = pcall(require, "nvim-web-devicons")
  local f_name, f_extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  f_extension = f_extension ~= "" and f_extension or vim.bo.filetype
  icon, icon_highlight_group = devicons.get_icon(f_name, f_extension)

  -- Fallback settings.
  if icon == nil and icon_highlight_group == nil then
    icon = ""
    icon_highlight_group = "DevIconDefault"
  end

  -- Set colors.
  local highlight_color = modules.utils.extract_highlight_colors(icon_highlight_group, "fg")
  if highlight_color then
    -- local default_highlight = self:get_default_hl()
    local icon_highlight = Icon_hl_cache[highlight_color]
    if not icon_highlight or not modules.highlight.highlight_exists(icon_highlight.name .. "_normal") then
      icon_highlight = self:create_hl({ fg = highlight_color }, icon_highlight_group)
      Icon_hl_cache[highlight_color] = icon_highlight
    end
    -- icon = self:format_hl(icon_highlight) .. icon .. default_highlight
  end

  -- Return the formatted string.
  return icon
end

function M:get_current_filename_with_icon()
  local suffix = ""

  -- Get icon and filename.
  local icon = M.get_current_filetype_icon(self)
  local f_name = get_current_filename()

  -- Add readonly icon.
  local readonly = vim.api.nvim_buf_get_option(0, "readonly")
  local modifiable = vim.api.nvim_buf_get_option(0, "modifiable")
  local nofile = get_current_buftype() == "nofile"
  if readonly or nofile or not modifiable then
    suffix = " "
  end

  -- Return the formatted string.
  return icon .. " " .. f_name .. suffix
end

local function parent_folder()
  local current_buffer = vim.api.nvim_get_current_buf()
  local current_file = vim.api.nvim_buf_get_name(current_buffer)
  local parent = vim.fn.fnamemodify(current_file, ":h:t")
  if parent == "." then
    return ""
  end
  return parent .. "/"
end

local function get_native_lsp()
  local buf_ft = get_current_filetype()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return ""
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "copilot" then
      return client.name
    end
  end
  return ""
end

-- Display the difference in commits between local and head.
local Job = require("plenary.job")
local function get_git_compare()
  -- Get the path of the current directory.
  local curr_dir = vim.api.nvim_buf_get_name(0):match("(.*" .. "/" .. ")")

  -- Run job to get git.
  local result = Job:new({
    command = "git",
    cwd = curr_dir,
    args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
  })
    :sync(100)[1]

  -- Process the result.
  if type(result) ~= "string" then
    return ""
  end
  local ok, ahead, behind = pcall(string.match, result, "(%d+)%s*(%d+)")
  if not ok then
    return ""
  end

  -- No file, so no git.
  if get_current_buftype() == "nofile" then
    return ""
  end
  local string = ""
  if behind ~= "0" then
    string = string .. " " .. behind
  end
  if ahead ~= "0" then
    string = string .. " " .. ahead
  end
  return string
end

-- Required to properly set the colors.
local c = require("catppuccin.palettes").get_palette("mocha")

local function telescope_text()
  return "Telescope"
end

local telescope = {
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = fmt_mode,
        icon = { "" },
        separator = { right = " ", left = "" },
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        telescope_text,
        color = { fg = c.surface1 },
        icon = { "  ", color = { fg = c.surface2 } },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "location",
        icon = { "", align = "left", color = { fg = c.crust } },
      },
      {
        "progress",
        icon = { "", align = "left", color = { fg = c.crust } },
        separator = { right = "", left = "" },
      },
    },
  },
  filetypes = { "TelescopePrompt" },
}
local options = {
  options = {
    section_separators = { left = " ", right = " " },
    component_separators = { left = "", right = "" },
    theme = "catppuccin",
    disabled_filetypes = { "dashboard" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = fmt_mode,
        icon = { "" },
        separator = { right = " ", left = "" },
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        parent_folder,
        color = { fg = c.surface1 },
        icon = { "   ", color = { fg = c.surface2 } },
        separator = "",
        padding = 0,
      },
      {
        get_current_filename,
        color = { fg = c.surface1 },
        separator = " ",
        padding = 0,
      },
      {
        "branch",
        color = { fg = c.surface1 },
        icon = { "   ", color = { fg = c.surface2 } },
        separator = " ",
        padding = 0,
      },
      {
        get_git_compare,
        separator = " ",
        padding = 0,
        color = { fg = c.surface1 },
      },
      {
        "diff",
        padding = 0,
        color = { fg = c.surface1 },
        icon = { " ", color = { fg = c.surface1 } },
        source = diff_source,
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = c.surface2 },
          modified = { fg = c.surface2 },
          removed = { fg = c.surface2 },
        },
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = "󱤅 ", other = "󰠠 " },
        diagnostics_color = {
          error = { fg = c.red },
          warn = { fg = c.yellow },
          info = { fg = c.teal },
          hint = { fg = c.hint },
        },
        colored = true,
        padding = 1,
      },
      {
        get_native_lsp,
        padding = 2,
        separator = " ",
        color = { fg = c.surface1 },
        icon = { " ", color = { fg = c.surface2 } },
      },
    },
    lualine_y = {},
    lualine_z = {
      {
        "location",
        icon = { "", align = "left", color = { fg = c.crust } },
      },
      {
        "progress",
        icon = { "", align = "left", color = { fg = c.crust } },
        separator = { right = "", left = "" },
      },
    },
  },
  extensions = { telescope },
}
return options
