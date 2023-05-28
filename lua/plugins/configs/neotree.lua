local options = {
  close_if_last_window = true,
  popup_border_style = "single",
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
  source = {
    "filesystem",
    "buffers",
    "git_status",
  },
  source_selector = {
    winbar = true,
    statusline = false,
    content_layout = "center",
    tabs_layout = "equal",
    sources = {
      { source = "filesystem", display_name = "  " },
      { source = "buffers", display_name = "  " },
      { source = "git_status", display_name = "  " },
      { source = "diagnostics", display_name = " 裂" },
    },
  },
  window = {
    mappings = {
      ["o"] = "open",
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
}
return options
