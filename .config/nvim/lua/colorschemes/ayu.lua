return {
    "Shatur/neovim-ayu",
    name = "colorscheme-ayu",
    lazy = false,
    priority = 1000,
    config = function()
        require("ayu").setup({})
    end
}
