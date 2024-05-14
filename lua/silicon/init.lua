local job = require("plenary.job")

local function silicon()
  local f = vim.fn.expand("%:p")
  local o = vim.fn.expand("%:t:r") .. ".png"
  vim.print(f)
  vim.print(o)

  job
    :new({
      command = "silicon",
      args = { f, "-o", o },
    })
    :start()
end

return {
  silicon = silicon,
}
