return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        local ts_install = require("nvim-treesitter.install")

        -----------------------------------------------------------------------
        -- Compiler selection for Tree-sitter parser builds
        --
        -- On Windows:
        --   - You have Zig installed and it's great as a self-contained C compiler.
        --   - We keep using { "zig" } there.
        --
        -- On Linux (Ubuntu, RHEL WSL, etc.):
        --   - We prefer the system C toolchain: cc/gcc/clang.
        --   - This avoids "No C compiler found! zig are not executable." spam
        --     when Zig is not installed on Linux.
        -----------------------------------------------------------------------
        local sysname = vim.loop.os_uname().sysname

        if sysname == "Windows_NT" then
            -- Windows: use Zig as the compiler for Tree-sitter parsers
            ts_install.compilers = { "zig" }
        else
            -- Linux / Unix: use normal C compilers
            -- "cc" is usually a symlink to gcc or clang
            ts_install.compilers = { "cc", "gcc", "clang" }
        end

        -----------------------------------------------------------------------
        -- Core nvim-treesitter configuration
        -----------------------------------------------------------------------
        configs.setup({
            -- Languages for which parsers should be installed
            ensure_installed = {
                "c",
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "query",
                "python",
                "regex",
                "sql",
                "toml",
                "xml",
                "yaml",
                "pem",
                "nginx",
                "passwd",
                "markdown",
                "markdown_inline",
                "json",
                "json5",
                "ini",
                "http",
                "csv",
                "css",
                "bash",
                "go",
                "c_sharp",
                "cpp",
            },

            -- Don't auto-install missing parsers on buffer open
            auto_install = false,

            -- Install parsers asynchronously (non-blocking)
            sync_install = false,

            -- Syntax highlighting based on Tree-sitter
            highlight = { enable = true },

            -- Indentation powered by Tree-sitter where supported
            indent = { enable = true },

            -- Incremental selection: grow/shrink selection by syntax node
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- Start a selection at the current cursor node
                    init_selection = "<Enter>",
                    -- Expand selection to the next node
                    node_incremental = "<Enter>",
                    -- Disable scope_incremental (you can map later if you want)
                    scope_incremental = false,
                    -- Shrink selection to previous node
                    node_decremental = "<Backspace>",
                },
            },
        })
    end,
}
