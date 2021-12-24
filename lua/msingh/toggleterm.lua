require"toggleterm".setup {
  size = 13,
  open_mapping = [[<c-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}

-- key map for this
-- vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm size=10 dir=~/ direction=float<CR>', {noremap = true, silent = true})
