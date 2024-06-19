return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").compilers = { "clang" }
        require("nvim-treesitter").setup({
            ensure_installed = {
                "c",
                "cpp",
                "css",
                "cmake",
                "dockerfile",
                "gitignore",
                "html",
                "java",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "query",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            -- indent = { enable = true },
        })
    end
}
