-- This file can be loaded by calling `lua require('plugins')` from your init.vim


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function() require'nvim-tree'.setup {} end
  }
  use {
       'alvarosevilla95/luatab.nvim',
        requires='kyazdani42/nvim-web-devicons' }
  use {'neovim/nvim-lspconfig'}
  use {'tpope/vim-commentary'}
  -- telescope
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/telescope.nvim'}

  use {'norcalli/nvim-colorizer.lua'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'windwp/nvim-autopairs'}
  use {'onsails/lspkind-nvim'}

  use {
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
          'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
          'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
          'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
      }
  }
  use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp'
  }

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)
