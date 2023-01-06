local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup{
function(use)
  use 'wbthomason/packer.nvim'
  use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons' }
  use 'nvim-lualine/lualine.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'rebelot/kanagawa.nvim'
  use { 'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons' }
  use 'neovim/nvim-lspconfig'
  use { 'ms-jpq/coq_nvim',
    branch = "coq" }
  use { 'ms-jpq/coq.artifacts',
    branch = "artifacts" }
  use { 'ms-jpq/coq.thirdparty',
    branch = "3p" }
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim' }
  use { "nvim-telescope/telescope-frecency.nvim",
    requires = "kkharji/sqlite.lua" }
  use 'goolord/alpha-nvim'
  use { 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate' }
  use 'nvim-telescope/telescope-project.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'stevearc/dressing.nvim'
  use 'navarasu/onedark.nvim'
  use { 'jedrzejboczar/possession.nvim',
    requires = 'nvim-lua/plenary.nvim' }
  use 'norcalli/nvim-colorizer.lua'
  use 'ellisonleao/glow.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'
  use 'folke/which-key.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}}
