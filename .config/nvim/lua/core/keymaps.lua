-- Save to disk
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<CMD>update<CR>", { desc = "Update buffer" })
vim.keymap.set("n", "<leader>w", "<CMD>wall<CR>", { desc = "Write all" })

-- Resize windows
vim.keymap.set("n", "<Right>", "<CMD>vertical resize +5<CR>", { desc = "Vertical resize +5" })
vim.keymap.set("n", "<Left>", "<CMD>vertical resize -5<CR>", { desc = "Vertical resize -5" })
vim.keymap.set("n", "<Up>", "<CMD>horizontal resize +2<CR>", { desc = "Horizontal resize +2" })
vim.keymap.set("n", "<Down>", "<CMD>horizontal resize -2<CR>", { desc = "Horizontal resize -2" })

-- Create and close tabs
vim.keymap.set("n", "<leader>tn", "<CMD>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tq", "<CMD>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>to", "<CMD>tabonly<CR>", { desc = "Close all other tabs" })

-- Change tabs
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>tabprevious<CR>", { desc = "Previous tab" })

vim.keymap.set({ "n", "t" }, "<C-1>", "<CMD>tabnext 1<CR>", { desc = "Jump to tab 1" })
vim.keymap.set({ "n", "t" }, "<C-2>", "<CMD>tabnext 2<CR>", { desc = "Jump to tab 2" })
vim.keymap.set({ "n", "t" }, "<C-3>", "<CMD>tabnext 3<CR>", { desc = "Jump to tab 3" })
vim.keymap.set({ "n", "t" }, "<C-4>", "<CMD>tabnext 4<CR>", { desc = "Jump to tab 4" })
vim.keymap.set({ "n", "t" }, "<C-5>", "<CMD>tabnext 5<CR>", { desc = "Jump to tab 5" })
vim.keymap.set({ "n", "t" }, "<C-6>", "<CMD>tabnext 6<CR>", { desc = "Jump to tab 6" })

-- Create and delete buffers
vim.keymap.set("n", "<leader>bn", "<CMD>enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>ba", "<CMD>%bdelete<CR>", { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>bo", "<CMD>%bdelete|edit#|bdelete#<CR>", { desc = "Delete all other buffers" })

-- Change buffers
vim.keymap.set("n", "<C-k>", "<CMD>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-j>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-p>", "<CMD>b#<CR>", { desc = "Last active buffer" })

-- Terminal window navigation
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

-- Diagnostic navigation
vim.keymap.set("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostic float" })
vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })

-- Shift selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shift selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shift selection up" })

-- Center cursor during half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down with centered cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up with centered cursor" })
