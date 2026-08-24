require'trouble'.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

vim.keymap.set("n", "<leader>lb", "<Cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>", {
    desc = "Buffer diagnostics (Trouble)",
})

vim.keymap.set("n", "<leader>lq", "<Cmd>Trouble qflist toggle focus=true<CR>", {
    desc = "Quickfix list (Trouble)",
})
