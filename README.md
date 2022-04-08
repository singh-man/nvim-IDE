### Install neovim
- Follow neovim latest installation guide; don't install via package manager (Debian/ubuntu)
- Setup a plugin manager like Vim Plug

### Install fonts
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/
- JetBrainsMono (preferred)
- Hack

Install nerd fonts type to get new icons and follow the install instructions.

In short
```
Put the fonts in
~/.local/share/fonts/
Run
fc-cache -f -v
Check the new fonts with 
fc-list | grep "Hack"
```
For Windows if using WSL2; above steps not needed.
- Install fonts in windows
- Configure Windows terminal to use font type "HACK":- Open it -> "Ctrl+," -> find an attribute "profiles{...} -> defaults{...} -> add to "defaults" an attribute "fontFace": "Hack Regular Nerd Font" to apply the font to all profiles.
- Also for Windows Terminal in the same settings, disable copy/paste for Ctrl-v and Ctrl-p.

### Clone this repo
- Under ~/.config/nvim -> make the dir **nivm**, if missing.

```git clone --depth 1 git@github.com:singh-man/nvim-IDE.git ~/.config/nvim```

OR

```git clone git@github.com:singh-man/nvim-IDE.git ~/.config/nvim```

OR

```git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim```

- without starting nvim ````nvim --headless +PlugInstall +qall```
- Start nvim like ```nvim <file name or leave blank>```
- Run ```:PlugInstall```
- Exit and restart
- First Run after plugins install; TreeSitter will trigger and will automatically install all its needed compilers.
- Install and modify LSP_servers as needed

### Install LSP servers
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- I am not using plugin nvim-lsp-installter so each lsp server needs to be manually installed; follow the above link.
- Modify file 'lua/msingh/nvim-lsp.lua' to add servers as needed

> Every lsp server has auto-load custom **root_folder**; do check the docs.

> ```<leader> '\'``` key is preferable for custom keymap as which-key plugins help becomes useful for it.

### Refrence .dotfiles for nvim

*Beginner Friendly*
https://www.jakewiesler.com/blog/getting-started-with-vim --- or --- https://github.com/jakewies/.dotfiles/blob/main/nvim/.config/nvim/

*Intermediate level*
https://github.com/VapourNvim/VapourNvim

*Advanced setup*
https://github.com/LunarVim/LunarVim
