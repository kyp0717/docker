-- This file can be loaded by calling `lua require('plugins')` from your init.vim


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use {'tpope/vim-commentary'}
  use 'ray-x/go.nvim'

end)
