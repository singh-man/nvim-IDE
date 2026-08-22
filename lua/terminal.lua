local map = vim.keymap.set

-- Open a login shell in Neovim's built-in terminal and enter terminal mode
local function open_terminal(split_command)
  vim.cmd(split_command)

  local job = vim.fn.jobstart({ vim.o.shell, "-l" }, { term = true })
  if job <= 0 then
    vim.notify("Failed to start login shell: " .. vim.o.shell, vim.log.levels.ERROR)
    return
  end

  vim.cmd("startinsert!")
end

-- Open terminal splits sized to 25% of the screen
map("n", "<leader>tv", function()
  local width = math.max(1, math.floor(vim.o.columns * 0.25))
  open_terminal(("botright %dvnew"):format(width))
end, { silent = true, desc = "Open vertical terminal" })

map("n", "<leader>th", function()
  local height = math.max(1, math.floor(vim.o.lines * 0.25))
  open_terminal(("botright %dnew"):format(height))
end, { silent = true, desc = "Open horizontal terminal" })
