local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed= {"go", "lua", "python"},
  highlight = {
    enable=true,
  },
  indent = {
    enable=true
  }

}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


local function test()
print "hello"
end

