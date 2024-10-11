return {
    "ribru17/bamboo.nvim",
    name = "colorscheme-bamboo",
    lazy = false,
    priority = 1000,
    config = function()
        require("bamboo").setup({})
    end
}
