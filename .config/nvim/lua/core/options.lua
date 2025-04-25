-- Use global status line
vim.opt.laststatus = 3

-- Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Add padding to scroll
vim.opt.scrolloff = 8

-- Always show signcolumn
vim.opt.signcolumn = "yes:2"

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Set case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable auto backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- What sessions save
vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos"

-- Fast update time
vim.opt.updatetime = 250

-- Use zsh as shell
vim.opt.shell = "/usr/bin/zsh"

-- Enable full color terminal
vim.opt.termguicolors = true

-- Set cursor shape and use highlight groups
vim.opt.guicursor = {
    "n-v-c:block-Cursor",
    "i-ci-ve:ver25-iCursor",
    "r-cr:hor20-rCursor",
    "o:hor50",
    "a:blinkon0"
}
