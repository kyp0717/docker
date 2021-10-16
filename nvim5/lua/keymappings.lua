-- Map leader to space
vim.g.mapleader = ' '

-- Map other keys
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode

map('n', '<Space>', '<NOP>')
map('n', '<Leader>h', ':set hlsearch!<CR>')
map('n', '<Leader>e', ':NvimTreeToggle<CR>')

map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- window movement 
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- buffer movement
map('n', '<Leader>bp', ':BufferPrevious<CR>', opts)
map('n', '<Leader>bb', ':BufferNext<CR>', opts)
-- hilight indenting
map('n', '<', '<gv')
map('n', '>', '>gv')

-- move selected line/block of text in visual mode
map('x', 'J', ':move \'>+1<CR>gv-gv\'')
map('x', 'K', ':move \'<-2<CR>gv-gv\'')

-- saving like VScode
map('n', '<C-s>', ':w<CR>')


