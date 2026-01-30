_G.User = {}

require("core")
require("neovide")

vim.cmd("colorscheme catppuccin")

-- Automatically sync Neovim background with macOS appearance
if User.g.is_macos then
  local function get_appearance()
    -- Returns true if macOS is in dark mode, false otherwise
    local cmd =
      "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
    local handle = io.popen(cmd, "r")
    if handle then
      local result = handle:read("*a"):gsub("[\n\r]", "")
      handle:close()
      return result == "true"
    end
    return false
  end

  local function sync_with_os(enabled)
    enabled = enabled or false
    if enabled then
      if get_appearance() then
        vim.opt.background = "dark"
      else
        vim.opt.background = "light"
      end
    end
  end

  -- Optionally, auto-sync on colorscheme change
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = sync_with_os,
  })

  sync_with_os(false)
end

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
