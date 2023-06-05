vim.opt.bg = "dark"
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.fileformat = "unix"
vim.opt.ignorecase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"
vim.opt.encoding = "UTF-8"
vim.opt.mouse = "a"
vim.opt.confirm = true
vim.opt.history = 1000
vim.g.neo_tree_remove_legacy_commands = 1
vim.opt.smartindent = true
vim.g.UltiSnipsExpandTrigger = "<S-t>"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.g.neovide then
	vim.o.guifont = "Fira Code Medium:h12"
	vim.g.neovide_scale_factor=0.75
	vim.keymap.set('v', '<C-c>', '"+y') 
	vim.keymap.set('n', '<C-v>', '"+P')
	vim.keymap.set('v', '<C-v>', '"+P')
	vim.keymap.set('c', '<C-v>', '<C-R>+')
	vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli')
end
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
	"phaazon/hop.nvim",
	"folke/which-key.nvim",
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{'romgrk/barbar.nvim', dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons',},init = function() vim.g.barbar_auto_setup = false end, opts={animation=true}},
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
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "yuck", "cpp", "bash", "vim", "vimdoc", "query", "python"},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = {"bash"},
	},
}
require("neo-tree").setup{
	event_handlers = { 
		{ 
			event = "vim_buffer_enter", 
			handler = function() 
				if vim.bo.filetype == "neo-tree" then 
					vim.cmd("setlocal nonumber") 
				end 
			end, 
		},
	}
}
vim.cmd([[
filetype on
syntax enable
filetype plugin indent on
colorscheme gruvbox
autocmd bufenter * if (winnr("$") == 1 && &filetype == "neo-tree") | q | endif
nmap <C-A> :Addtc<CR>
nmap <C-T> :Test<CR>
nmap <C-S> :Submit<CR>
nmap tt :ToggleTerm direction=float<CR>
:Neotree
nmap ll :Lazy<CR>
]])
