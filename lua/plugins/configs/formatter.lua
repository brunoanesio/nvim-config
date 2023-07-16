local util = require("formatter.util")
local prettierd = function()
  return {
    exe = "prettierd",
    args = { util.escape_path(util.get_current_buffer_file_path()) },
    stdin = true,
  }
end
local opts = {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },

    python = {
      require("formatter.filetypes.python").black,
      function()
        return {
          exe = "black",
          args = {
            "--fast",
          },
        }
      end,
    },

    htmldjango = {
      function()
        return {
          exe = "djlint",
          args = { "--reformat", "-" },
        }
      end,
    },

    sh = {
      require("formatter.filetypes.sh").shfmt,
    },

    c = {
      require("formatter.filetypes.c").clangformat,
    },

    toml = {
      require("formatter.filetypes.toml").taplo,
    },

    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },

    markdown = {
      require("formatter.filetypes.markdown").prettierd,
    },

    css = {
      require("formatter.filetypes.css").prettierd,
    },

    html = {
      require("formatter.filetypes.html").prettierd,
    },

    json = {
      require("formatter.filetypes.json").prettierd,
    },

    jsonc = { prettierd },

    yaml = {
      require("formatter.filetypes.yaml").prettierd,
    },

    scss = { prettierd },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}
return opts
