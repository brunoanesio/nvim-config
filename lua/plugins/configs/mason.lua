local M = {}
M.opts = {
  pip = {
    upgrade_pip = true,
  },
  ui = {
    border = "none",
    icons = {
      package_installed = "󰄳 ",
      package_pending = " ",
      package_uninstalled = " ",
    },
  },
}
M.install = function()
  local utils = require("plugins.utils")
  local mr = require("mason-registry")
  local packages = utils.mason_packages
  for _, package in ipairs(packages) do
    local p = mr.get_package(package)
    if not p:is_installed() then
      p:install()
    end
  end
end
return M
