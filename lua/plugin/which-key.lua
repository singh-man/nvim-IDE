local wk = require("which-key")

wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local function jq_format(input)
  if vim.fn.executable("jq") ~= 1 then
    vim.notify("jq is not installed", vim.log.levels.ERROR)
    return nil
  end

  local result = vim.system({ "jq", "." }, { stdin = input, text = true }):wait()

  if result.code ~= 0 then
    local message = vim.trim(result.stderr or "")
    if message == "" then
      message = "jq failed with exit code " .. result.code
    end
    vim.notify(message, vim.log.levels.ERROR)
    return nil
  end

  local lines = vim.split(result.stdout or "", "\n", { plain = true })
  if lines[#lines] == "" then
    table.remove(lines)
  end

  return lines
end

local function format_json_with_jq()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = jq_format(table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n"))
  if not lines then
    return
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end

local function format_json_selection_with_jq()
  local visual_mode = vim.fn.mode()
  if visual_mode == "\22" or visual_mode == "<C-v>" then
    vim.notify("jq formatting does not support block selections", vim.log.levels.ERROR)
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local start = vim.fn.getpos("v")
  local finish = vim.fn.getpos(".")

  if start[2] > finish[2] or (start[2] == finish[2] and start[3] > finish[3]) then
    start, finish = finish, start
  end

  local start_row = start[2] - 1
  local start_col = start[3] - 1
  local end_row = finish[2] - 1
  local end_col = finish[3]

  if visual_mode == "V" then
    start_col = 0
    end_col = -1
  end

  local input = table.concat(
    vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col, {}),
    "\n"
  )
  local lines = jq_format(input)
  if not lines then
    return
  end

  if visual_mode == "V" then
    vim.api.nvim_buf_set_lines(bufnr, start_row, end_row + 1, false, lines)
  else
    vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, lines)
  end
end

wk.add({
    -- { "<leader>jq", "<cmd>keepjumps %!jq .<cr>", desc = "Format JSON with jq", mode = "n" },
    { "<leader>jq", format_json_with_jq, desc = "Format JSON with jq", mode = "n" },
    { "<leader>jq", format_json_selection_with_jq, desc = "Format selected JSON with jq", mode = "v" },
    {
      "<leader>p",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Format file or range",
      mode = { "n", "v" },
    },
    { "<leader>t", group = "Terminal" },
    { "<leader>l", group = "LSP/Trouble" },
    { "<leader>f", group = "File/Telescope" },
    { "<leader>f1", hidden = true },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
    -- { "<leader>fe", desc = "Edit File- only a label" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find tags" },
    -- { "<leader>fn", desc = "New File- only a label" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", remap = true },
    {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})
