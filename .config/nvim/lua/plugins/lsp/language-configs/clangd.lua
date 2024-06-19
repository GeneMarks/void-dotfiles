return {
    cmd = {
        "clangd",
        "--all-scopes-completion",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--fallback-style=llvm",
        "--header-insertion=iwyu",
    }
}
