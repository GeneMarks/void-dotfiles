return {
    "zaldih/themery.nvim",
    config = function()
        require("themery").setup({
            themes = {
                {
                    name = "Ayu Dark",
                    colorscheme = "ayu-dark",
                },
                {
                    name = "Ayu Light",
                    colorscheme = "ayu-light",
                },
                {
                    name = "Ayu Mirage",
                    colorscheme = "ayu-mirage",
                },
                {
                    name = "Catppuccin Frappe",
                    colorscheme = "catppuccin-frappe",
                },
                {
                    name = "Catppuccin Latte",
                    colorscheme = "catppuccin-latte",
                },
                {
                    name = "Catppuccin Macchiato",
                    colorscheme = "catppuccin-macchiato",
                },
                {
                    name = "Catppuccin Mocha",
                    colorscheme = "catppuccin-mocha",
                },
                {
                    name = "Github Dark High Contrast",
                    colorscheme = "github_dark_high_contrast",
                },
                {
                    name = "Tokyonight Day",
                    colorscheme = "tokyonight-day",
                },
                {
                    name = "Tokyonight Moon",
                    colorscheme = "tokyonight-moon",
                },
                {
                    name = "Tokyonight Night",
                    colorscheme = "tokyonight-night",
                },
                {
                    name = "Tokyonight Storm",
                    colorscheme = "tokyonight-storm",
                },
                {
                    name = "Oxocarbon Dark",
                    colorscheme = "oxocarbon",
                    before = [[
                        vim.opt.background = "dark"
                    ]],
                },
                {
                    name = "Oxocarbon Light",
                    colorscheme = "oxocarbon",
                    before = [[
                        vim.opt.background = "light"
                    ]],
                },
            }
        })

        vim.keymap.set("n", "<leader>c", "<CMD>Themery<CR>", { desc = "Change colorscheme" })
    end
}
