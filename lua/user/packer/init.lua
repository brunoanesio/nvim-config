-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")
	-- Misc
	use("kyazdani42/nvim-web-devicons")
	use("folke/todo-comments.nvim")
	use("stevearc/dressing.nvim")
	use("nvim-lualine/lualine.nvim")
	use("SmiteshP/nvim-navic")
	-- QoL
	use("lewis6991/impatient.nvim")
	use("famiu/bufdelete.nvim")
	use("folke/which-key.nvim")
	use("matbme/JABS.nvim")
	use("RRethy/vim-illuminate")
	use("brenoprata10/nvim-highlight-colors")
	use("kylechui/nvim-surround")
	use("karb94/neoscroll.nvim")
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")
	use("davidgranstrom/nvim-markdown-preview")

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" })
	-- IDE features
	use("kyazdani42/nvim-tree.lua")
	use("rcarriga/nvim-notify")
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use("lewis6991/gitsigns.nvim")
	use("numToStr/Comment.nvim")
	use({ "akinsho/toggleterm.nvim" })
	-- use({ "goolord/alpha-nvim" })
	use({ "glepnir/dashboard-nvim" })
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("nvim-telescope/telescope-symbols.nvim")
	use("AckslD/nvim-neoclip.lua")
	-- LSP
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("j-hui/fidget.nvim")
	use({
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jose-elias-alvarez/typescript.nvim",
		"simrat39/rust-tools.nvim",
		-- CMP
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
		"rafamadriz/friendly-snippets",
		-- Null-ls
		"jose-elias-alvarez/null-ls.nvim",
	})
end)
