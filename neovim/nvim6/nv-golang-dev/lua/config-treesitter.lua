local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed= {"go", "lua"},
  highlight = {
    enable=true,
  },
  indent = {
    enable=true
  }

}

-- vim.wo.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim-treesitter#foldexpr()'

-- vim.opt.foldmethod = vim.opt.foldmethod
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.api.nvim_exec([[
--   set foldmethod=expr
--   set foldexpr=nv
-- ]])

local function test()
print "hello"
end

