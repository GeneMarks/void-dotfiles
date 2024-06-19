return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            delete_to_trash = true,
        })

        vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Oil" })
    end
}
