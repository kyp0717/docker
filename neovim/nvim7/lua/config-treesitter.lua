local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed="maintained",
  highlight = {
    enable=true,
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable=true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-r>",
    },
  },
    textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
    }
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

-- vim.cmd([[
-- set fillchars=fold:━
-- set fillchars=fold:━
-- let g:crease_foldtext = { 'default': '%f%f┫ %t%{CreaseChanged()} ┣%=┫ %l lines ┣%f%f' }
-- function! CreaseChanged()
--     return gitgutter#fold#is_changed() ? ' *' : ''
-- endfunction
-- ]])



