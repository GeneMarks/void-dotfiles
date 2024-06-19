return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>dd", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Diagnostics list" })
        vim.keymap.set("n", "<leader>db", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics list" })
        vim.keymap.set("n", "<leader>ds", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Symbols" })
        vim.keymap.set("n", "<leader>dl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP definitions" })
    end
}
