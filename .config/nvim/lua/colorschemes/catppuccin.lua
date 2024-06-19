return {
    "catppuccin/nvim",
    name = "colorscheme-catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            no_bold = true,
            highlight_overrides = {
                latte = function(latte)
                    return {
                        MatchParen = { bg = "#e2e4e9" },
                    }
                end
            }
        })
    end
}
