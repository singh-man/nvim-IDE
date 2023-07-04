-- must be set before calling require
-- vim.g.nvim_tree_ignore = {'*.tmp', '.git'}
vim.g.nvim_tree_indent_markers = 1
require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "case_sensitive",
  ignore_ft_on_setup = {'dashboard'},
  auto_close = true,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },
  git = { enable = true, ignore = true, timeout = 500, },
  view = { width = 25, side = 'left', adaptive_size = true, mappings = {custom_only = false, list = {}}},
  trash = {cmd = "trash", require_confirm = true }
}

-- NeoVim key map for this
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nr', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
