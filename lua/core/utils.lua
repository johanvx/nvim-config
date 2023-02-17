User.fn = {}

---file_exists - Verify if a file exists
---@param path string
---@return boolean
function User.fn.file_exists(path)
  return vim.fn.filereadable(path) == 1
end

---dir_exists - Verify if a directory exists
---@param path string
---@return boolean
function User.fn.dir_exists(path)
  return vim.loop.fs_stat(path) ~= nil and vim.fn.filereadable(path) == 0
end

---@type string
local path_sep = vim.loop.os_uname().sysname == "Windows_NT" and "\\" or "/"

---path_concat - Concatenate paths to base with os-related separator
---@param base string
---@param ... string
---@return string
function User.fn.path_concat(base, ...)
  local count = select("#", ...)
  assert(
    count >= 1,
    "expected at least 2 arguments, got " .. tostring(count + 1)
  )

  local ret = base
  vim.validate({ ["argument 1"] = { ret, "string" } })
  for i = 1, count do
    local path = select(i, ...)
    vim.validate({ ["argument " .. tostring(i + 1)] = { path, "string" } })
    ret = ret .. path_sep .. path
  end
  return ret
end

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
