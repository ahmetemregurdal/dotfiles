vim.opt.bg = "dark"
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.fileformat = "unix"
vim.opt.ignorecase = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"
vim.opt.encoding = "UTF-8"
vim.opt.mouse = "a"
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.smartindent = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
require("lazy").setup({
    "searleser97/cpbooster.vim",
    "morhetz/gruvbox",
    "mbbill/undotree",
		{"SirVer/ultisnips",dependencies = {"honza/vim-snippets"}},
    "psliwka/vim-smoothie",
		"ycm-core/YouCompleteMe",
    "christoomey/vim-system-copy",
    "jszakmeister/vim-togglecursor",
    "fladson/vim-kitty",
    "mboughaba/i3config.vim",
    {"nvim-treesitter/nvim-treesitter", build = "TSUpdate"},
    {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" }},
		{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
		"lervag/vimtex",
		{"goolord/alpha-nvim",dependencies = {"nvim-tree/nvim-web-devicons","nvim-telescope/telescope.nvim","nvim-lua/plenary.nvim"}},
		"phaazon/hop.nvim",
		"folke/which-key.nvim"
  })
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
require'alpha'.setup(require'alpha.themes.dashboard'.config)
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "yuck", "cpp", "bash", "vim", "vimdoc", "query", "python"},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {"bash"},
  },
}
vim.cmd([[
  filetype on
  syntax enable
  filetype plugin indent on
  colorscheme gruvbox
	let g:neo_tree_remove_legacy_commands = 1
	let g:vimtex_view_general_viewer = 'okular'
	let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
	let g:vimtex_compiler_method = 'latexrun'
	autocmd bufenter * if (winnr("$") == 1 && &filetype == "neo-tree") | q | endif
	nmap <C-A> :Addtc<CR>
	nmap <C-T> :Test<CR>
	nmap <c-S> :Submit<CR>
	let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd' ,'coc-sh']
]])
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

  [[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],

}

 dashboard.section.buttons.val = {
   dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
   dashboard.button("e", "New file", ":ene <BAR> <CR>:NeoTreeShow<CR>i"),
   dashboard.button("r", "Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "Configuration", ":e ~/.config/nvim/init.lua<CR>:NeoTreeShow<CR>"),
   dashboard.button("q", "Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "Don't Stop Until You are Proud..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
