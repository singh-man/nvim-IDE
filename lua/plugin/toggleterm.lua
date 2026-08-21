require"toggleterm".setup {
  size = 13,
  open_mapping = [[<c-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}

-- key map for this
vim.keymap.set("n", "<leader>t", "<Cmd>ToggleTerm size=10 dir=~/ direction=float<CR>", {
  silent = true,
  desc = "Toggle floating terminal",
})
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm size=40 dir=~/ direction=vertical<CR>", {
  silent = true,
  desc = "Toggle vertical terminal",
})
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm size=10 dir=~/ direction=horizontal<CR>", {
  silent = true,
  desc = "Toggle horizontal terminal",
})
