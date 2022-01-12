
-- importing supporting config files
require('settings')
require('keymappings')
require('plugins')
-- require('lspkind-nvim')
require'nvim-tree'.setup {}
-- vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'
require('nvim-autopairs').setup{}
require('config-cmp')

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

