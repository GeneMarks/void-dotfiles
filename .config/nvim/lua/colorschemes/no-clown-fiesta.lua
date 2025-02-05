return {
    "aktersnurra/no-clown-fiesta.nvim",
    name = "colorscheme-no-clown-fiesta",
    lazy = false,
    priority = 1000,
    config = function()
        require("no-clown-fiesta").setup({})
    end
}
