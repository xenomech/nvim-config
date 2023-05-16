-- [[ options.lua ]]
vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


require('lualine').setup()
require("bufferline").setup{
    options={ offsets = {
        {
            filetype = "neo-tree",
            text = "Files",
            separator = true
        }
    },}

}

--
-- Treesitter config
--

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "ruby", "go", "c", "lua", "vim", "vimdoc", "query" },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
    },
}




--
-- lsp config
--

local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.nvim_workspace()
-- Make sure you setup `cmp` after lsp-zero

lsp.set_preferences({
    suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})



--
-- cmp config
--

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    }
})


require('neo-tree').setup({
    window = {
        width = 30,
        mappings = {
            ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
            ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
            ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
            ["<space>"] = { 
                "toggle_node", 
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
        },
    },
})


