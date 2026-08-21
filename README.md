
This configuration uses Neovim 0.12+'s built-in `vim.pack` plugin manager.

### Install neovim
- Follow neovim latest installation guide; avoid via package manager (Debian/ubuntu). https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
- Install Git, curl, a C compiler, and `tree-sitter-cli` 0.26.1 or newer for plugins and Tree-sitter parsers.
- Install Python 3 and pip.
- Install Node.js and npm for Prettier and Node-based language servers managed by Mason.

### Install fonts

Install nerd fonts type to get new icons and follow the install instructions.
- JetBrainsMono (preferred)
- Hack

#### Linux

https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/ 
```
Put the fonts in
~/.local/share/fonts/
Run
fc-cache -f -v
Check the new fonts with 
fc-list | grep "Jet"
```

#### Windows [WSL]

Download fonts from https://www.nerdfonts.com/font-downloads

- Install fonts in Windows via Windows settings.
- Configure Windows terminal to use font type "Jet":- Open it -> "Ctrl+," -> find an attribute "profiles{...} -> defaults{...} -> add to "defaults" an attribute "fontFace": "Hack Regular Nerd Font" to apply the font to all profiles.
- Also for Windows Terminal in the same settings, disable copy/paste for Ctrl-v and Ctrl-p.

### Clone this repo
- Under ~/.config/nvim -> make the dir **nvim**, if missing.

```git clone --depth 1 git@github.com:singh-man/nvim.git ~/.config/nvim```

OR (if you have ssh development key)

```git clone git@github.com:singh-man/nvim.git ~/.config/nvim```

OR

```git clone https://github.com/singh-man/nvim.git ~/.config/nvim```

Windows

```git clone https://github.com/singh-man/nvim.git ~/AppData/Local/nvim```

### Install plugins

- Start Neovim with `nvim`. `vim.pack.add()` installs any missing plugins automatically.
- Tree-sitter installs the configured language parsers asynchronously on the first run. Restart Neovim after installation finishes.
- To update plugins later, run `:lua vim.pack.update()`, review the proposed changes, and use `:write` to confirm them.
- Run `:TSUpdate` after updating `nvim-treesitter` so installed parsers remain compatible.
- Install and modify LSP_servers as needed

### Install LSP servers
- Plugin `mason.nvim` is configured, so lsp-servers can be installed with command `:MasonInstall <server>` or for manual installation of lsp-servers, follow [https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
- Modify file `lua/plugin/nvim-lsp.lua` to enable servers as needed

> Every lsp server has auto-load custom **root_folder**; do check the docs.

> ```<leader> 'Space'``` key is used for custom keymap as which-key plugins help becomes useful; or reverto to default ```\``` in init.vim.

### Format files

[`conform.nvim`](https://github.com/stevearc/conform.nvim) is configured to use Prettier for JavaScript, TypeScript, JSON, JSONC, YAML, HTML, CSS, SCSS, Less, Vue, Angular, Markdown, MDX, GraphQL, and Handlebars files.

Install Prettier through Mason from inside Neovim:

```vim
:MasonInstall prettier
```

Press `<leader>p` in normal mode to format the current file. Select a range in visual mode and press `<leader>p` to format only that range. Run `:ConformInfo` to check which formatter is available for the current buffer.

The `<leader>jq` mapping formats the entire JSON buffer with `jq`. Install `jq` separately if it is not already available:

```sh
# Debian/Ubuntu/WSL
sudo apt install jq
```

The `jq` mapping requires valid JSON and does not support comments in JSONC files.


### Refrence .dotfiles for nvim

*Beginner Friendly*
https://www.jakewiesler.com/blog/getting-started-with-vim --- or --- https://github.com/jakewies/.dotfiles/blob/main/nvim/.config/nvim/

*Intermediate level*
https://github.com/VapourNvim/VapourNvim

*Good One*
https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim

*Advanced setup*
https://github.com/LunarVim/LunarVim
