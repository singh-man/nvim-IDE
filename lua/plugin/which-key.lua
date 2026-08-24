local wk = require("which-key")

wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local function format_json_with_jq()
  if vim.fn.executable("jq") ~= 1 then
    vim.notify("jq is not installed", vim.log.levels.ERROR)
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local input = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
  local result = vim.system({ "jq", "." }, { stdin = input, text = true }):wait()

  if result.code ~= 0 then
    local message = vim.trim(result.stderr or "")
    if message == "" then
      message = "jq failed with exit code " .. result.code
    end
    vim.notify(message, vim.log.levels.ERROR)
    return
  end

  local lines = vim.split(result.stdout or "", "\n", { plain = true })
  if lines[#lines] == "" then
    table.remove(lines)
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end

wk.add({
    -- { "<leader>jq", "<cmd>keepjumps %!jq .<cr>", desc = "Format JSON with jq", mode = "n" },
    { "<leader>jq", format_json_with_jq, desc = "Format JSON with jq", mode = "n" },
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
