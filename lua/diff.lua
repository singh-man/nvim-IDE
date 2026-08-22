local map = vim.keymap.set

-- Diff current buffer with another open buffer
map("n", "<leader>db", function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()

  local buffers = vim.tbl_filter(function(buf)
    return buf ~= current_buf
      and vim.api.nvim_buf_is_loaded(buf)
      and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if #buffers == 0 then
    vim.notify("No other listed buffers to diff", vim.log.levels.INFO)
    return
  end

  vim.ui.select(buffers, {
    prompt = "Diff with buffer",
    format_item = function(buf)
      local name = vim.api.nvim_buf_get_name(buf)
      return vim.fn.fnamemodify(name ~= "" and name or "[No Name]", ":~:.")
    end,
  }, function(buf)
    if not buf then
      return
    end

    vim.cmd("vertical sbuffer " .. buf)
    local diff_win = vim.api.nvim_get_current_win()

    vim.api.nvim_set_current_win(current_win)
    vim.cmd("diffthis")
    vim.wo.wrap = true

    vim.api.nvim_set_current_win(diff_win)
    vim.cmd("diffthis")
    vim.wo.wrap = true
  end)
end, { desc = "Diff with buffer" })

-- Turn off diff mode and close the compared split
map("n", "<leader>do", function()
  local current_win = vim.api.nvim_get_current_win()
  local diff_wins = vim.tbl_filter(function(win)
    return vim.api.nvim_win_is_valid(win) and vim.wo[win].diff
  end, vim.api.nvim_tabpage_list_wins(0))

  vim.cmd("diffoff!")

  for _, win in ipairs(diff_wins) do
    if win ~= current_win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Diff off" })
