local wk = require("which-key")

wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
wk.register({
  f = {
    name = "telescope", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Find tags" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
    n = { "New File- only a label" }, -- just a label. don't create any mapping
    e = "Edit File- only a label", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" })
