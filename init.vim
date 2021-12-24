set encoding=UTF-8
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
set mouse=a                 " Mouse support enabled
set noshowmode              " the command bar -- INSERT -- is not shown
set timeoutlen=800          " timeout
" set termguicolors
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set ic                      " search igone case

" " START opens nvim internal terminal below :- prefer use some plugin          
" " open new split panes to right and below
" set splitright
" set splitbelow
" " turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" " start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open terminal on ctrl+n
" function! OpenTerminal()
"   split term://bash
"   resize 10
" endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>
" " STOP

" Installed Plugins
call plug#begin()
" NVIM tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons this is used by many plugins
Plug 'kyazdani42/nvim-tree.lua'

" Cheatsheet popup - uses nvim-web-devicons
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Neovim TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Tabs
Plug 'romgrk/barbar.nvim'

" Terminals
Plug 'akinsho/toggleterm.nvim'      " prefer using this with <leader> key
Plug 'voldikss/vim-floaterm'        " has shortcut for nnn, lazygit don't use

" Lualine status bar - uses nvim-web-devicons
Plug 'nvim-lualine/lualine.nvim'

" Which key
Plug 'folke/which-key.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'     
Plug 'jose-elias-alvarez/null-ls.nvim'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
" LuaSnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" VSCode like
Plug 'onsails/lspkind-nvim'

" Trouble - uses web-dev-icons
Plug 'folke/trouble.nvim'
call plug#end()


" Custom mappings
" Another way to add these mappings in lua file check nvim-tree.lua

" Barbar map
nnoremap <silent><A-,> :BufferPrevious<CR>
" nnoremap <silent><A-left> :BufferPrevious<CR>
nnoremap <silent><A-.> :BufferNext<CR>
" nnoremap <silent><A-right> :BufferNext<CR>G
nnoremap <silent><A-<> :BufferMovePrevious<CR>                                                                   
nnoremap <silent><A->> :BufferMoveNext<CR>
nnoremap <silent><c-w> :BufferClose<CR>
nnoremap <silent><A-{}> :BufferGoto {}<CR>

" <leader> based keys below this----------------------------------------- 

" Save all buffers -special using space-bar
nnoremap <space>w :wa<CR>

" Terminal config
nnoremap <leader>t <cmd>ToggleTerm size=10 dir=~/ direction=float<CR>
nnoremap <leader>tv <cmd>ToggleTerm size=40 dir=~/ direction=vertical<CR>
nnoremap <leader>th <cmd>ToggleTerm size=10 dir=~/ direction=horizontal<CR>
" nnoremap <silent><c-t> :FloatermNew<CR>
" nnoremap <leader>nnn :FloatermNew nnn<CR>

" Telescope
" nnoremap <leader>ff <cmd>Telescope find_files<CR>
" nnoremap <leader>fb <cmd>Telescope buffers<CR>
" nnoremap <leader>fg <cmd>Telescope live_grep<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<CR>
" nnoremap <leader>fr <cmd>Telescope oldfiles<CR>

" Plugins config
lua require('msingh')
