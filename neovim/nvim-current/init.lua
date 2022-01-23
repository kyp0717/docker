
-- importing supporting config files
require('settings')
require('keymappings')
require('plugins')
require'nvim-tree'.setup {}
require('nvim-autopairs').setup{}
-- require('config-cmp')
require('tjdevries-completion')
require('config-golang')
require('config-lsp')
require('config-treesitter')

require'nvim-web-devicons'.get_icons()
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

-- require'lspconfig'.rust_analyzer.setup({})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

vim.opt.termguicolors = true


local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

----- plugins -----
----- put on init file since I like to see it first
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
-- paq {'shougo/deoplete-lsp'}
-- paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
-- g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup



local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- Plug 'tpope/vim-sensible'
Plug 'dylon/vim-antlr'
Plug 'scr1pt0r/crease.vim'
vim.call('plug#end')

vim.cmd([[
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
]])
