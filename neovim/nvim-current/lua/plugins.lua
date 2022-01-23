-- This file can be loaded by calling `lua require('plugins')` from your init.vim


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {'kyazdani42/nvim-web-devicons'}
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function() require'nvim-tree'.setup {} end
  }
  use {
       'alvarosevilla95/luatab.nvim',
        requires='kyazdani42/nvim-web-devicons' }

  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }

  use {'folke/tokyonight.nvim'}
  use {'ishan9299/modus-theme-vim'}
  use {'tpope/vim-commentary'}
  -- telescope
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/telescope.nvim'}

  use {'norcalli/nvim-colorizer.lua'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'windwp/nvim-autopairs'}
  use {'onsails/lspkind-nvim'}
  use {"tjdevries/colorbuddy.nvim"}

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {'akinsho/bufferline.nvim', 
        requires = 'kyazdani42/nvim-web-devicons'}


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
  use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp'
  }


  use {
    "AckslD/nvim-neoclip.lua",
    requires = {'tami5/sqlite.lua', module = 'sqlite'},
    config = function()
      require('neoclip').setup()
    end,
  }

  use 'ray-x/go.nvim'
  use 'L3MON4D3/LuaSnip'

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)
