-- This file can be loaded by calling `lua require('plugins')` from your init.vim


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'

  use {'tpope/vim-commentary'}

  use {
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-buffer", 
          "hrsh7th/cmp-nvim-lsp",
          -- 'quangnguyen30192/cmp-nvim-ultisnips', 
          'hrsh7th/cmp-nvim-lua',
          'octaltree/cmp-look', 
          'hrsh7th/cmp-path', 
          'hrsh7th/cmp-calc',
          'f3fora/cmp-spell', 
          'hrsh7th/cmp-emoji',
          'saadparwaiz1/cmp_luasnip'
      }
  }
  -- use {
  --     'tzachar/cmp-tabnine',
  --     run = './install.sh',
  --     requires = 'hrsh7th/nvim-cmp'
  -- }

  use 'ray-x/go.nvim'
  use 'L3MON4D3/LuaSnip'

end)
