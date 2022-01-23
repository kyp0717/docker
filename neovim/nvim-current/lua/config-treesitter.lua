local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed="maintained",
  highlight = {
    enable=true,
  },
  indent = {
    enable=true
  }

}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- vim.api.nvim_command('set fillchars+=foldopen:▾,foldsep:│,foldclose:▸')
-- vim.api.nvim_command('set fillchars+=foldclose:▸')
-- vim.cmd([[
-- function! MyFoldText()
--     let nl = v:foldend - v:foldstart + 1
--     let comment = substitute(getline(v:foldstart),"^ *","",1)
--     let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
--     let txt = '+ ' . linetext . ' : "' . comment . '" : length ' . nl
--     return txt
-- endfunction
-- set foldtext=MyFoldText()
-- ]])

vim.cmd([[
set fillchars=fold:━
let g:crease_foldtext = { 'default': '%f%f┫ %t%{CreaseChanged()} ┣%=┫ %l lines ┣%f%f' }

function! CreaseChanged()
    return gitgutter#fold#is_changed() ? ' *' : ''
endfunction
]])

local function test()
print "hello"
end

