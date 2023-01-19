local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		use("nvim-lualine/lualine.nvim")
    use({
      "xiyaowong/nvim-transparent",
      config = function()
        require("transparent").setup({ enable = vim.g.transparent })
      end
    })
		use({ "navarasu/onedark.nvim", opt = true })
		use({ "Mofiqul/dracula.nvim", opt = true })
		use({ "rebelot/kanagawa.nvim", opt = true })
		use({
      "folke/tokyonight.nvim",
      config = function()
        require("tokyonight").setup({ transparent = true, style = "storm" })
      end
    })
		use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
		use("neovim/nvim-lspconfig")
		use({ "ms-jpq/coq_nvim", branch = "coq" })
		use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
		use({ "ms-jpq/coq.thirdparty", branch = "3p" })
		use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = "nvim-lua/plenary.nvim" })
		use({ "nvim-telescope/telescope-frecency.nvim", requires = "kkharji/sqlite.lua" })
		use("goolord/alpha-nvim")
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-telescope/telescope-project.nvim")
		use("nvim-telescope/telescope-symbols.nvim")
		use("nvim-telescope/telescope-fzf-native.nvim")
		use("nvim-telescope/telescope-file-browser.nvim")
		use("stevearc/dressing.nvim")
		use("norcalli/nvim-colorizer.lua")
		use({
      "ellisonleao/glow.nvim", 
      cmd = "Glow",
      config = function()
        require("glow").setup({
          style = "dark",
          border = "rounded",
          width_ratio = 0.7,
          height_ratio = 0.7,
        })
      end
    })
		use("lukas-reineke/indent-blankline.nvim")
    use("arkav/lualine-lsp-progress")
		use("numToStr/Comment.nvim")
		use("folke/which-key.nvim")
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("null-ls").setup()
			end,
		})
		use("echasnovski/mini.surround")
		use("echasnovski/mini.cursorword")
		use("echasnovski/mini.align")
		use("echasnovski/mini.sessions")
		use("echasnovski/mini.pairs")
		use({
			"s1n7ax/nvim-window-picker",
			config = function()
				require("window-picker").setup({
					autoselect_one = true,
					include_current = true,
					filter_rules = {
						-- filter using buffer options
						bo = {
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							buftype = { "terminal", "quickfix" },
						},
					},
					other_win_hl_color = "#e35e4f",
				})
			end,
		})
		use("MunifTanjim/nui.nvim")
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			config = function()
				-- Unless you are still migrating, remove the deprecated commands from v1.x
				vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
				vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
				vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
				vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			end,
		})
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
