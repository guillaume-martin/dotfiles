local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- User a protected call so we don't error out on first use 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init{
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)

   use 'wbthomason/packer.nvim'
   use "nvim-lua/plenary.nvim"

   -- telescope
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.1',
     requires = { {'nvim-lua/plenary.nvim'} }
   }

   -- treesitter
   use ( 'nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})

   -- undotree
   use "mbbill/undotree"
   
   -- fugitive
   use "tpope/vim-fugitive"

 	-- Autocompletion
   	-- https://github.com/topics/nvim-cmp
   	use 'hrsh7th/nvim-cmp'
   	use 'hrsh7th/cmp-nvim-lsp'
   	use 'hrsh7th/cmp-buffer'
   	use 'hrsh7th/cmp-path'
   	use 'saadparwaiz1/cmp_luasnip'
   	use 'hrsh7th/cmp-nvim-lua'

	-- Snippets
  	use 'L3MON4D3/LuaSnip'
   	use 'rafamadriz/friendly-snippets'

    -- LSP
    use {
      'neovim/nvim-lspconfig',             -- enable LSP
      'williamboman/mason.nvim',           -- simple to use language server installer
      'williamboman/mason-lspconfig.nvim', -- simple to use language server installer
    -- 'jose-elias-alvarez/null-ls.nvim',   -- for formatters and linters
    }

    -- Easily comment lines
    -- `gcc` to comment current line. `gc` to comment target of motion
    use "tpope/vim-commentary"

    -- Install theme
    use "ellisonleao/gruvbox.nvim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Highlight color codes
    use "NvChad/nvim-colorizer.lua"

    -- Automatic closing of quotes, parenthesis, brackets, etc...
    use "raimondi/delimitmate"

    -- Productivity
    use "dhruvasagar/vim-table-mode"
--    use { "preservim/vim-markdown" }
    use 'SidOfc/mkdx'
    use "godlygeek/tabular"

    -- Add tmux line
    use "edkolev/tmuxline.vim"

    -- Automatically set up your configuration after cloning packer.vim 
    -- Put this at the end after all plugins 
    if PACKER_BOOTSTRAP then 
        require("packer").sync()
    end
end)


