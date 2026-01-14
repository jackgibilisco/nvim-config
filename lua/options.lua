-- Basic settings
vim.opt.number = true -- show absolute line number for the current line
vim.opt.relativenumber = true -- show relative numbers for other lines
vim.opt.wrap = false -- don't wrap long lines
vim.opt.tabstop = 4 -- width of a TAB character
vim.opt.shiftwidth = 4 -- width used for autoindent
vim.opt.expandtab = true -- insert spaces when Tab is pressed
vim.opt.termguicolors = true -- enable 24-bit colors (required by many themes)
vim.opt.mouse = "a" -- allows mouse in all modes
vim.opt.showmode = false -- removes insert text

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Persist undo
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

-- scroll a bit extra horizontally and vertically when at the end/bottom
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- Title
vim.opt.title = true                       -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"


-- Allow recursive Searching
vim.opt.path = vim.opt.path + "**"
vim.opt.path = vim.opt.path + "~/.config/nvim/"
