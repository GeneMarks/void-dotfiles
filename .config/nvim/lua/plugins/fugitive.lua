return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>g", "<CMD>Git<CR>", { desc = "Fugitive" })
    end
}
