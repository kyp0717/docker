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

-- vim.wo.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim-treesitter#foldexpr()'

vim.opt.foldmethod = vim.opt.foldmethod
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim-treesitter#foldexpr()'



local function test()
print "hello"
end

