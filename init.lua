_G.User = {}

require("core")
require("neovide")

vim.cmd("colorscheme catppuccin")

if User.g.is_macos then
  local sync_with_os = function()
    local get_appearance = function()
      return "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
    end
    local status, f = pcall(io.popen, get_appearance(), "r")
    if status then
      local s = f:read("*a"):gsub("[\n\r]", "")
      f:close()
      local string2boolean = { ["true"] = true, ["false"] = false }
      if string2boolean[s] then
        vim.cmd("set bg=dark")
      else
        vim.cmd("set bg=light")
      end
    end
  end
  sync_with_os()
end

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
