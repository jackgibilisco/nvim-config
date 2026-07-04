-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.showmode = false

--Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.path = vim.opt.path + "**"

--Persist undo
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

--Scroll a bit extra at the end
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

--Title
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - nvim"

--Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- -------------------------
--          Plugins
-- -------------------------
local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    gh('folke/tokyonight.nvim'),
    gh('nvim-tree/nvim-web-devicons'),
    gh('nvim-tree/nvim-tree.lua'), --depends on devicons
    gh('nvim-lua/plenary.nvim'),
    gh('nvim-telescope/telescope.nvim'), --depends on plenary
    gh('windwp/nvim-autopairs'),
    gh('saghen/blink.lib'),
    gh('saghen/blink.cmp'),
    gh('jake-stewart/multicursor.nvim'),
    gh('numToStr/Comment.nvim')
})

-- -------- Plugin Config ----------

-- Colorscheme
vim.cmd("colorscheme tokyonight")

-- Autopairs
require('nvim-autopairs').setup()

-- Multicursor
local mc = require('multicursor-nvim')
mc.setup()
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn"})
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})

-- Tree
require('nvim-tree').setup({
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {
            ".DS_Store",
            ".git",
        },
    },
})

-- Comment
require('Comment').setup({
    toggler = {
        line = '<leader>/',
    },
    opleader = {
        line = '<leader>/',
    }
})

-- cmp
local cmp = require('blink.cmp')
cmp.build():pwait()
local cmpopts = {
    keymap = {
        preset = "enter",
        ['<Up>'] = { "select_prev", "fallback" },
        ['<Down>'] = { "select_next", "fallback" },
        ['<Tab>'] = { "select_next", "fallback" },
        ['<S-Tab>'] = { "select_prev", "fallback" },
        ['<C-b>'] = { "scroll_documentation_up", "fallback" },
        ['<C-f>'] = { "scroll_documentation_down", "fallback" },
        ['<C-k>'] = { "show_signature", "hide_signature", "fallback" },
    },

    appearance = {
        nerd_font_variant = "mono",
    },

    sources = {
        default = {"path", "buffer"},

        providers = {
            path = {
                opts = {
                    get_cwd = function() return vim.fn.cetcwd() end,
                }
            }
        }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
        keyword = { range = "prefix" },
        menu = {
            draw = {
                treesitter = { "lsp" },
            },
        },
        trigger = { show_on_trigger_character = true },
        documentation = { auto_show = true },
    },

    signature = { enabled = true },
}
cmp.setup(cmpopts)

-- -------------------------
--         Keybinds
-- -------------------------

-- -------- General --------

-- common options
local opts = {
    noremap = true,
    silent = true,
}

-- "Natural typing" shortcuts
vim.keymap.set("i", "<M-BS>", '<esc>"_ciw', opts)
vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)

-- Leader key and mapping helper
vim.g.mapleader = " " -- leader = space
-- Keybinds
vim.keymap.set("n", "q", "<C-r>", opts) -- redo
vim.keymap.set("n", "<leader>w", ":w<CR><C-L>", opts) -- save
vim.keymap.set("n", "@", "!", opts)
vim.keymap.set("n", "!", ":!", opts)
vim.keymap.set("n", "<leader>g", ":find ", opts)
vim.keymap.set("n", "<leader>t", ":split<CR><C-L><C-W><C-J>:resize 10<CR><C-L>:term<CR><C-L>", opts) -- terminal
--vim.keymap.set("n", "<leader>r", ":%s/", opts) -- search and replace
vim.keymap.set("n", "<leader>d", ":nohlsearch<CR><C-L>", opts)
vim.keymap.set("t", "<esc>", "<C-\\><C-N>", opts)

-- Moving between splits and resizing
vim.keymap.set("n", "<leader>c", ":close<CR><C-L>", opts) -- close tab
vim.keymap.set("n", "<leader>q", ":qa!<CR><C-L>", opts) -- quit
vim.keymap.set("n", "<C-j>", "<C-W><C-J>", opts)
vim.keymap.set("n", "<C-k>", "<C-W><C-K>", opts)
vim.keymap.set("n", "<C-l>", "<C-W><C-L>", opts)
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", opts)
vim.keymap.set({"i", "v"}, "<C-j>", "<esc><C-W><C-J>", opts)
vim.keymap.set({"i", "v"}, "<C-k>", "<esc><C-W><C-K>", opts)
vim.keymap.set({"i", "v"}, "<C-l>", "<esc><C-W><C-L>", opts)
vim.keymap.set({"i", "v"}, "<C-H>", "<esc><C-W><C-H>", opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-W><C-J>", opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-W><C-K>", opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-W><C-L>", opts)
vim.keymap.set("t", "<C-H>", "<C-\\><C-N><C-W><C-H>", opts)

-- Terminal nicety
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function(args)
        local opts = { buffer = args.buf, silent = true }
        vim.keymap.set('n', "<Up>", "i<Up>", opts)
    end,
})

vim.keymap.set("n", "<leader>b", ":!./build.sh<CR><C-L>", opts)

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- -------- Plugin Keybinds --------

-- nvim tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle file tree" })
vim.keymap.set('n', '<leader>r', ':NvimTreeFindFile<CR>', { desc = "Toggle file tree" })

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "find files" })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "live grep" })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = "list buffers" })

-- multicursor
vim.keymap.set({'n', 'x'}, '<up>', function() mc.lineAddCursor(-1) end)
vim.keymap.set({'n', 'x'}, '<down>', function() mc.lineAddCursor(1) end)
vim.keymap.set({'n', 'x'}, '<leader><up>', function() mc.lineSkipCursor(-1) end)
vim.keymap.set({'n', 'x'}, '<leader><down>', function() mc.lineSkipCursor(1) end)

vim.keymap.set({'n', 'x'}, '<leader>n', function() mc.matchAddCursor(1) end)
vim.keymap.set({'n', 'x'}, '<leader>s', function() mc.matchSkipCursor(1) end)
vim.keymap.set({'n', 'x'}, '<leader>N', function() mc.matchAddCursor(-1) end)
vim.keymap.set({'n', 'x'}, '<leader>S', function() mc.matchSkipCursor(-1) end)

vim.keymap.set({'n', 'x'}, '<c-q>', mc.toggleCursor)

mc.addKeymapLayer(function(layerSet)
    layerSet('n', '<esc>', function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)


