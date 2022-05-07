local cmp = require('cmp')
local lspkind = require "lspkind"
lspkind.init()

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup {
    formatting = {
      -- Youtube: How to set up nice formatting for your sources.
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
          gh_issues = "[issues]",
          -- tn = "[TabNine]",
        },
      },
    },
    experimental = {
      -- I like the new menu better! Nice work hrsh7th
      native_menu = false,

      -- Let's play with this for a day or two
      ghost_text = false,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or
                    vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    return vim.fn.feedkeys(t(
                                               "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"))
                end
                vim.fn.feedkeys(t("<C-n>"), "n")
            elseif check_back_space() then
                vim.fn.feedkeys(t("<tab>"), "n")
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-p>"), "n")
            else
                fallback()
            end
        end, {"i", "s"})
    },
    -- Youtube: mention that you need a separate snippets plugin
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = {
        {name = 'gh_issues'}, 
        {name = 'nvim_lsp'}, 
        {name = "nvim_lua"}, 
        {name = "luasnip"}, 
        {name = 'buffer', keyword_length = 4}, 
        {name = "path"},
        -- {name = "look"},
        -- {name = "path"},
        -- {name = 'cmp_tabnine'}, 
        -- {name = "calc"},
        -- {name = "spell"},
        -- {name = "emoji"}
    },
    completion = {completeopt = 'menu,menuone,noinsert'},
}

-- autocmd FileType go lua require('cmp').setup.buffer({ sources = {{ name = 'nvim_lsp'}, {name='cmp_tabnine'}}})
vim.cmd([[
autocmd FileType go lua require('cmp').setup.buffer({ sources = {{ name = 'nvim_lsp'}, }})
]])


-- Autopairs
-- require("nvim-autopairs.completion.cmp").setup({
--     map_cr = true,
--     map_complete = true,
--     auto_select = true
-- })

-- TabNine
-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})

-- Database completion
-- vim.api.nvim_exec([[
-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
-- ]], false)
