-- importing supporting config files
require('settings')
require('keymappings')
require('plugins')
-- require'nvim-tree'.setup {}
require('config-nvimtree')
-- require('config-bufferline')
require('nvim-autopairs').setup{}
-- require('config-cmp')
require('tjdevries-completion')
require('config-lsp')
require('config-golang')
require('config-treesitter')
require('config-lightspeed')
require('Comment').setup()

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



