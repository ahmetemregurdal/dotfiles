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
	"psliwka/vim-smoothie",
	"christoomey/vim-system-copy",
	"jszakmeister/vim-togglecursor",
	"fladson/vim-kitty",
	"mboughaba/i3config.vim",
	"nvim-treesitter/nvim-treesitter",
	{"nvim-neo-tree/neo-tree.nvim", branch = "v2.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" }},
	{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
	"phaazon/hop.nvim",
	"folke/which-key.nvim",
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{'romgrk/barbar.nvim', dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons',},init = function() vim.g.barbar_auto_setup = false end, opts={animation=true}},
	{ "lukas-reineke/indent-blankline.nvim" },
	'rcarriga/nvim-notify',
	{"folke/noice.nvim",dependencies = {"MunifTanjim/nui.nvim","rcarriga/nvim-notify",}},
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	"petertriho/cmp-git",
	"neovim/nvim-lspconfig",
	"williamboman/nvim-lsp-installer",
})
