return {
    "famiu/bufdelete.nvim",
    config = function()
        vim.keymap.set("n", "<leader>bd", "<CMD>Bdelete<CR>", { desc = "Delete current buffer" })
    end
}
