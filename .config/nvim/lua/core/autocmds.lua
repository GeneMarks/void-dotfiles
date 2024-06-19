-- Enter insert mode on terminal buffers
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", "TabEnter" }, {
    pattern = "term://*",
    command = "startinsert",
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})
