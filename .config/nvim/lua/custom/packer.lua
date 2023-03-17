-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
 
   -- Packer can manage itself
   -- source: https://github.com/wbthomason/packer.nvim
   use 'wbthomason/packer.nvim'

   -- Install telescope
   -- source: https://github.com/nvim-telescope/telescope.nvim
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.1',
     requires = { {'nvim-lua/plenary.nvim'} }
   }

   -- Install treesitter
   -- source: https://github.com/nvim-treesitter/nvim-treesitter
   use ( 'nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})

   -- Install undotree
   -- source: https://github.com/mbbill/undotree
   use("mbbill/undotree")
   
   -- Install fugitive
   use ("tpope/vim-fugitive")

   -- Install lsp zero
   -- source: https://github.com/VonHeikemen/lsp-zero.nvim
   use {
       'VonHeikemen/lsp-zero.nvim',
  	branch = 'v1.x',
  	requires = {
    		-- LSP Support
    		{'neovim/nvim-lspconfig'},             -- Required
    		{'williamboman/mason.nvim'},           -- Optional
    		{'williamboman/mason-lspconfig.nvim'}, -- Optional

    		-- Autocompletion
    		{'hrsh7th/nvim-cmp'},         -- Required
    		{'hrsh7th/cmp-nvim-lsp'},     -- Required
    		{'hrsh7th/cmp-buffer'},       -- Optional
    		{'hrsh7th/cmp-path'},         -- Optional
    		{'saadparwaiz1/cmp_luasnip'}, -- Optional
    		{'hrsh7th/cmp-nvim-lua'},     -- Optional

    		-- Snippets
    		{'L3MON4D3/LuaSnip'},             -- Required
    		{'rafamadriz/friendly-snippets'}, -- Optional
  	}
   }

   -- Install theme
   -- source: https://github.com/ellisonleao/gruvbox.nvim
   use { "ellisonleao/gruvbox.nvim" }

   use {
       'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }

   -- Automatic closing of quotes, parenthesis, brackets, etc...
   use { "raimondi/delimitmate" }

    -- Productivity
    use {"vimwiki/vimwiki" }
    use { "tools-life/taskwiki" }
    use { "dhruvasagar/vim-table-mode" }

end)
