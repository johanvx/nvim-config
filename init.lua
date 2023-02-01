_G.User = {}

require("core.utils")
require("core.globals")
require("core.envs")
require("core.options")
require("core.keymaps")
require("core.lazy")

vim.cmd("colorscheme catppuccin")
-- Disable cursorline highlight
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
-- Make comment more eye-catching
vim.api.nvim_set_hl(0, "Comment", { fg = "#eba0ac" })

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
