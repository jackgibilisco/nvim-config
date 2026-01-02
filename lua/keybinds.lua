-- common options
local opts = {
    noremap = true,
    silent = true,
}

-- Leader key and mapping helper
vim.g.mapleader = " " -- leader = space
-- Keybinds
vim.keymap.set("n", "q", "<C-r>", opts) -- redo
vim.keymap.set("n", "<leader>s", ":w<CR><C-L>", opts) -- save
vim.keymap.set("n", "<leader>t", ":split<CR><C-L><C-W><C-J>:resize -10<CR><C-L>:term<CR><C-L>", opts) -- terminal
vim.keymap.set("n", "<leader>r", ":%s/", opts) -- search and replace
vim.keymap.set("n", "<leader>d", ":nohlsearch<CR><C-L>", opts)
vim.keymap.set("t", "<esc>", "<C-\\><C-N>", opts)

-- Moving between splits and resizing
vim.keymap.set("n", "<leader>w", ":close<CR><C-L>", opts) -- close tab
vim.keymap.set("n", "<leader>h", ":vsplit<CR><C-L>", opts) -- vertical split
vim.keymap.set("n", "<C-j>", "<C-W><C-J>", opts)
vim.keymap.set("n", "<C-k>", "<C-W><C-K>", opts)
vim.keymap.set("n", "<C-l>", "<C-W><C-L>", opts)
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical:resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical:resize +2<CR>", opts)

vim.keymap.set("n", "<leader>b", ":!./build.sh", opts)

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)
