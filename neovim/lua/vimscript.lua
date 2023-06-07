vim.cmd([[
filetype on
syntax enable
filetype plugin indent on
colorscheme gruvbox
autocmd bufenter * if (winnr("$") == 1 && &filetype == "neo-tree") | q | endif
:LspStart bashls
:LspStart lua_ls
:LspStart clangd
:LspStart pyright
]])
